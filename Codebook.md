The dataset is a transformed subset of the "Human Activity Recognition Using Smartphones Dataset" by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto at Smartlab in Genoa, Italy. Quoting from the original description:

***
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  

... 
***

There are more variables estimated in the original dataset but they are irelevant here.

The estimations of mean() and std() for the above 66 variables (...-XYZ denotes in fact 3 variables: ...-X, ...-Y, ...-Z) were merged with the activities and subjects provided in the original dataset, resulting a dataset with 68 variables.

The 2 new variables are:

subject.id - the id (from 1 to 30) of the volunteer performing the activity  
activity.name - one of the 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)  

A new, tidy, dataset was created containing the averages of all the variables grouped by subject id and activity name. The resulting variable list is this:

subject.id   
activity.name   
AverageOf.tBodyAcc.mean...X  
AverageOf.tBodyAcc.mean...Y  
AverageOf.tBodyAcc.mean...Z  
AverageOf.tBodyAcc.std...X  
AverageOf.tBodyAcc.std...Y  
AverageOf.tBodyAcc.std...Z  
AverageOf.tGravityAcc.mean...X  
AverageOf.tGravityAcc.mean...Y  
AverageOf.tGravityAcc.mean...Z  
AverageOf.tGravityAcc.std...X  
AverageOf.tGravityAcc.std...Y  
AverageOf.tGravityAcc.std...Z  
AverageOf.tBodyAccJerk.mean...X  
AverageOf.tBodyAccJerk.mean...Y  
AverageOf.tBodyAccJerk.mean...Z  
AverageOf.tBodyAccJerk.std...X  
AverageOf.tBodyAccJerk.std...Y  
AverageOf.tBodyAccJerk.std...Z  
AverageOf.tBodyGyro.mean...X  
AverageOf.tBodyGyro.mean...Y  
AverageOf.tBodyGyro.mean...Z  
AverageOf.tBodyGyro.std...X  
AverageOf.tBodyGyro.std...Y  
AverageOf.tBodyGyro.std...Z  
AverageOf.tBodyGyroJerk.mean...X  
AverageOf.tBodyGyroJerk.mean...Y  
AverageOf.tBodyGyroJerk.mean...Z  
AverageOf.tBodyGyroJerk.std...X  
AverageOf.tBodyGyroJerk.std...Y  
AverageOf.tBodyGyroJerk.std...Z  
AverageOf.tBodyAccMag.mean..  
AverageOf.tBodyAccMag.std..  
AverageOf.tGravityAccMag.mean..  
AverageOf.tGravityAccMag.std..  
AverageOf.tBodyAccJerkMag.mean..  
AverageOf.tBodyAccJerkMag.std..  
AverageOf.tBodyGyroMag.mean..  
AverageOf.tBodyGyroMag.std..  
AverageOf.tBodyGyroJerkMag.mean..  
AverageOf.tBodyGyroJerkMag.std..  
AverageOf.fBodyAcc.mean...X  
AverageOf.fBodyAcc.mean...Y  
AverageOf.fBodyAcc.mean...Z  
AverageOf.fBodyAcc.std...X  
AverageOf.fBodyAcc.std...Y  
AverageOf.fBodyAcc.std...Z  
AverageOf.fBodyAccJerk.mean...X  
AverageOf.fBodyAccJerk.mean...Y  
AverageOf.fBodyAccJerk.mean...Z  
AverageOf.fBodyAccJerk.std...X  
AverageOf.fBodyAccJerk.std...Y  
AverageOf.fBodyAccJerk.std...Z  
AverageOf.fBodyGyro.mean...X  
AverageOf.fBodyGyro.mean...Y  
AverageOf.fBodyGyro.mean...Z  
AverageOf.fBodyGyro.std...X  
AverageOf.fBodyGyro.std...Y  
AverageOf.fBodyGyro.std...Z  
AverageOf.fBodyAccMag.mean..  
AverageOf.fBodyAccMag.std..  
AverageOf.fBodyBodyAccJerkMag.mean..  
AverageOf.fBodyBodyAccJerkMag.std..  
AverageOf.fBodyBodyGyroMag.mean..  
AverageOf.fBodyBodyGyroMag.std..  
AverageOf.fBodyBodyGyroJerkMag.mean..  
AverageOf.fBodyBodyGyroJerkMag.std..  
    

