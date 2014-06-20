## Introduction

This is the CodeBook file for Coursera's Getting and Cleaning Data Course Project.
It describes the variables used in the project. 

The data for the project was downloaded from:

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Coursera Repository</a>


* <b>Description</b>: taken from the original data from file "features_info.txt" and adapted to the new variables names:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc.XYZ and tGyro.XYZ. These time domain signals ,<b>(prefix 't' to denote time)</b> were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc.XYZ and tGravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk.XYZ and tBodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc.XYZ, fBodyAccJerk.XYZ, fBodyGyro.XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. <b>(Note the 'f' to indicate frequency domain signals)</b>. 

These signals were used to estimate variables of the feature vector for each pattern:  
'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


There are 33 main variables names:
<ol>
<li>tBodyAcc.XYZ</li>
<li>tGravityAcc.XYZ</li>
<li>tBodyAccJerk.XYZ</li>
<li>tBodyGyro.XYZ</li>
<li>tBodyGyroJerk.XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc.XYZ</li>
<li>fBodyAccJerk.XYZ</li>
<li>fBodyGyro.XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ol>

For each of the 33 variables above we used their mean values 'mean' and standard deviation 'std' for the processing,
coming to a total of 66 variables. Ex: tBodyAcc.mean.X, tBodyGyro.std.Y and so on.

<b>The values in each row of the dataset for the 66 variables represents the average value for each observation per activity and person id calculated with the R funciont 'mean()'.</b>   


There are two other variables in the "tidydata.txt" file:
<ol>
<li><b>activity_name</b>: Stores the descriptive name of the activity the person was performing when the data were acquired.
Can take the values: 'WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING'.</li>
<li><b>subject_id</b>: THe identification of the person performing the activities. Can take numeric values from '1' to '30'.</li>
</ol>