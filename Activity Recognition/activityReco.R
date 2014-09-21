library(plyr)

path <- "C:/Coursera2/"
filename <- "UCI_HAR_Dataset.zip"

if (!file.exists(path)) dir.create(path)
setwd(path)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile= paste(path, filename, sep= ""))
unzip(filename)
#setwd("C:/Coursera/getting_and_cleaning_data/course_project/UCI HAR Dataset")
setwd("./UCI HAR Dataset")
getwd()


## Read the data

# Training set
X_train <- read.table("./train/X_train.txt", header= F)
y_train <- read.table("./train/y_train.txt", header= F)
subject_train <- read.table("./train/subject_train.txt", header= F)

# Testing set
X_test <- read.table("./test/X_test.txt", header= F)
y_test <- read.table("./test/y_test.txt", header= F)
subject_test <- read.table("./test/subject_test.txt", header= F)

# Further resources
features <- read.table("./features.txt", header= F, col.names= c("id_feature", "name"))
activity_labels <- read.table("./activity_labels.txt", header= F, col.names= c("id_activity", "label"))


## Preprocess the data

# Append subjects and activities to the train and test sets
X_train <- cbind(subject_train, y_train, X_train)
X_test <- cbind(subject_test, y_test, X_test)

## 1. Merges the training and the test sets to create one data set and label the variables
data <- rbind(X_train, X_test)
colnames(data) <- c("subject", "id_activity", as.character(features$name)) ## 4.


## Extracts only the measurements on the mean and standard deviation for each measurement
indx <- grep("mean()|std()", names(data))
data <- data[,c(1,2,indx)]


## 3. Uses descriptive activity names to name the activities in the data set
data <- join(data, activity_labels, by= "id_activity")
data$id_activity <- data$label; data$label <- NULL; colnames(data)[2] <- "activity"


## 5. From the data set in step 4, creates a second, independent tidy data set with the
## average of each variable for each activity and each subject
Tidy <- ddply(data, c("subject", "activity"),
              function(data) apply(data[,3:ncol(data)], 2, mean, na.rm= T), .progress= "text")


## Clean the Environment
rm(X_train, X_test, activity_labels, features, subject_test, subject_train, y_test, y_train, indx)

