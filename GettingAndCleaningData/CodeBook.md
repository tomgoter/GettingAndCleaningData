# CodeBook for run_analysis.r

## Description of *average_data* Dataset
* This dataset is a tidy, subset of originally provided data. 
* Data for only mean() and std() were retained. Therefore there are only 66 feature variables (33 * 2)
* Additionally there are two factor variables included - *subjectid* and *activity*
* Using the factor variables, the average or mean of each feature variable for each *subjectid* and *activity* are provided in the final dataset
	+ Since there are 6 *activity* options and 30 *subjectid* options - there should be 180 final observations in the *average_dataset*

### Features - this section summarizes the 66 feature variables which are all normalized numeric variables with values between [-1, 1]
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 


### *Notes*
* These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* Features are normalized and bounded within [-1,1].

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

* mean(): Mean value
* std(): Standard deviation

### *subjectid* - Column 1 - Integer - [1-30]
This variable is the subject identifier.  There are 30 subjects.

### *activity* - Column 2 - Character
There are six possible activities for each subject.  These activities were originally labled with id numbers.  In the *average_data* dataset these numbers have been replaced with the actual activity. The six lables are listed below:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING