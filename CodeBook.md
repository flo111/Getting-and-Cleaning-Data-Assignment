Codebook for the dataset "tidyData" - Getting and Cleaning Data Assignment
=================

The tidy dataset is created from original data measured by mobile sensors. The following text provides a detailed description of how the original data were acquired:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


In the course of cleaning the data, the original variables have been given descriptive names. As there are separate variables for time and frequency data indicated by the preceding "t" and "f", respectively, the variable names have been correspondigly adapted. Furthermore, the variables have been renamed to avoid the use of special characters.

The following list contains the new variable names and the corresponding old version of the variable name:  

*timeBodyAcc.XYZ <- tBodyAcc-XYZ
*timeGravityAcc.XYZ <- tGravityAcc-XYZ
*timeBodyAccJerk.XYZ <- tBodyAccJerk-XYZ
*timeBodyGyro.XZY <- tBodyGyro-XYZ
*timeBodyGyroJerk.XZY <- tBodyGyroJerk-XYZ
*timeBodyAccMag <- tBodyAccMag
*timeGravityAccMag <- tGravityAccMag
*timeBodyAccJerkMag <- tBodyAccJerkMag
*timeBodyGyroMag <- tBodyGyroMag
*timeBodyGyroJerkMag <- tBodyGyroJerkMag
*freqBodyAcc.XYZ <- fBodyAcc-XYZ
*freqBodyAccJerk.XYZ <- fBodyAccJerk-XYZ
*freqBodyGyro.XYZ <- fBodyGyro-XYZ
*freqBodyAccMag <- fBodyAccMag
*freqBodyAccJerkMag <- fBodyAccJerkMag
*freqBodyGyroMag <- fBodyGyroMag
freqBodyGyroJerkMag <- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

*mean(): Mean value
*std(): Standard deviation
*meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Multiple measurements for one subject and one activity level have been averaged to obtain a single value for each combination of subject and activity. Each row therefore contains the data for one subject-activity combination. The information can be found in the following variables:

*subjects: subject ID for all subjects from the original training and test dataset ranging from 1 to 30
*labels: labels for six different activities for which sensor data have been acquired: walking, walkingUpstairs, walkingDownstairs, standing, sitting, laying