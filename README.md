## Introduction

This is the ReadMe file for Coursera's Getting and Cleaning Data Course Project.
It describes the steps taken in the R script run_analysis.R (in this GitHub repository) to process the given dataset and fulfill the project's requirements.

The data for the project was downloaded from:

<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Coursera Repository</a>

 The projet requirement was: create one R script called run_analysis.R that does the following: 

<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li> 
<li>Uses descriptive activity names to name the activities in the data set.</li>
<li>Appropriately labels the data set with descriptive variable names.</li> 
<li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li> 
</ol>


## Files used

<ol>
<li><b>README.txt</b>: General information about the data and files - MUST read!!!</li>
<li><b>features.txt</b>: contains the variable names for the training and test sets.</li>
<li><b>features_info.txt</b>: explains the variables and its names' construction.</li>
<li><b>activity_labels.txt</b>: descriptive names for variables in y_test.txt and y_train.txt</li>
<li><b>subject_test.txt</b>: subject identification for each row of X_test.txt</li>
<li><b>X_test.txt</b>: variables data for test subjects.</li>
<li><b>y_test.txt</b>: activity identification number for each row of X_test.txt</li>
<li><b>subject_train.txt</b>: subject identification for each row of X_train.txt</li>
<li><b>X_train.txt</b>: variables data for train subjects.</li>
<li><b>y_train.txt</b>: activity identification number for each row of X_train.txt</li>
</ol>

## Files not used

* The choice was made to not process any files on the "Inertial Signals" folder.
This is due to the fact that after careful examination of the Inertial data, none of them
contained any variable on mean or standard deviation of measurements. The data would be processed 
only to be discarded when subsetting the merged dataset.


## Steps Taken


* Download the dataset in an appropriate folder and unzip its contents.

* Explore the files and folders structure to find relevant information files.

* Study "README.txt", "activity_labels.txt", "features_info.txt" and "features.txt" 

* read "features.txt" and process its data in a char vector to be used as columns names for the test and train datasets.

* read  and process "activity_labels.txt" to obtain a vector with the desciptive names for the activity values in 
"y_test.txt" and "y_train.txt".

* process test dataset:
<ol>
<li>read "y_test.txt" and change activity numbers for descriptive activiy names as a factor variable.</li>
<li>read "subject_test.txt" and store id information of participants in test dataset as a factor variable.</li> 
<li>read test set variables data in "x_test.txt" creating the "testset" dataframe.</li>
<li>add column names in "features" vector to 'testset' and bind subject info and activity info to test data set 'testset'.</li> 
<li>test dataset 'testset' is ready to be merged.</li> 
</ol>

* process train dataset:
<ol>
<li>read "y_train.txt" and change activity numbers for descriptive activiy names as a factor variable.</li>
<li>read "subject_train.txt" and store id information of participants in train dataset as a factor variable.</li> 
<li>read train set variables data in "x_train.txt" creating the "trainset" dataframe.</li>
<li>add column names in "features" vector to 'trainset' and bind subject info and activity info to train data set 'trainset'.</li> 
<li>train dataset 'trainset' is ready to be merged.</li> 
</ol>

## Project Course requirements section

* 1. rbind 'testset' and 'trainset' datasets to obtain merged dataset 'train_test_data'.
* 2. extract only the measurements on the mean and standard deviation for each measurement by grepping "mean()" and "std()" in var names.
* 3. already substituted prevoiusly the activity id by descriptive acitivity names.
* 4. relabeld the variables in a simple manner due to my opinion that their original names were quite descriptive and further processing would make variable names unconfortably long. Just took off "()" out of variable names and replaced "-" by "." to enhance compatibility with R syntax.
* 5 created a second, independent tidy data set 'avg_data' with the average of each variable for each activity and each subject by agregating the rows data with function 'mean()' with respect do activity name and subject id. 
* 6. ordered resulting 'avg_data' dataset by activity and subject_id in numeric order and generated output file 'tinydata.txt' in 'data' folder. 
