## Intro
All the getting and cleaning are made through the activityReco.R script. It
first downloads the data provided (and stores it in a folder called `Coursera2`
in the `C` directory) and then starts the pre-processing. It requires the `plyr`
library. You can run it all at once.



## Data Description
The final data is stored in the `Tidy` data frame object. It contains 81
variables and 10299 observations (128.8 kB). The following variables are
available:

1. subject: the person who performed the activity
2. activity: the type of the activity  
3:81. ~: signals captured by the smartphone  



## Subject Labels
Subjects are numbered from 1 to 30.  



## Activity Labels
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING  


## Measures Labels
These signals were used to estimate variables of the feature vector for each
pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation