## run_analysis.R

#######################################################################################
## First section of the code:
##  - creates a dir named 'data'to hold the data to be used
##  - downloads the file from the internet in .zip format
##  - unzips the file and reads the containing files
## - for the rest of the script I will use the file structure of the unzipped files in the 'data' folder
#######################################################################################

if (!file.exists("data")){
      dir.create("data")
}

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./data/dataset.zip", method= "curl")
#fileinfo <-unzip("./data/temp",list=TRUE)  --can be used to store finlenames from .zip if they are not known
unzip("./data/dataset.zip", exdir="./data")

#######################################################################################
## Second section:
## - Reading files with data necessary for processing both test and train data
#######################################################################################

## reading features.txt
## this file data will be used as the column names for the tidy datasets to be created

coldata <-read.table("./data/UCI HAR Dataset/features.txt", header=FALSE)
colnames(coldata)<- c("id" ,"features" )
coldata$features<-as.character(coldata$features)


## reading activity_labels.txt
## that will be used as descriptive vars in the dataset

activitylabels<-read.table("./data/UCI HAR Dataset/activity_labels.txt", header=FALSE)
colnames(activitylabels)<-c("activity_id", "activity_name")
activitylabels$activity_name<-as.character(activitylabels$activity_name)


#######################################################################################
## Third section:
## - Reading and preaparing test sample data 'testset' dataset
#######################################################################################


## reading activity info for test data
## assigning descriptive names for acitivity info based on activitylabels table

testlabels<-read.table("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE)
colnames(testlabels)<-"activity_name"
testlabels$activity_name<-as.factor(testlabels$activity_name)
levels(testlabels$activity_name) <- activitylabels$activity_name

## reading id information of participants in test dataset

subjecttest<-read.table("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
colnames(subjecttest)<-c("subject_id")
subjecttest$subject_id<-as.factor(subjecttest$subject_id)

## reading test set variables data

testset<-read.table("./data/UCI HAR Dataset/test/x_test.txt", header=FALSE)

## adding colnames to 'testset' and binding subject info and activity info to test data set 'testset'

features<-coldata$features
colnames(testset)<-features[1:dim(coldata)[1]]
testset<-cbind(testset,testlabels)
testset<-cbind(testset,subjecttest)

#######################################################################################
## 'testset' dataset ready!!
#######################################################################################



#######################################################################################
## Fourth section:
## - Reading and preaparing training sample data 'trainset' dataset
#######################################################################################


## reading activity info for train data
## assigning descriptive names for acitivity info based on activitylabels table

trainlabels<-read.table("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE)
colnames(trainlabels)<-c("activity_name")
trainlabels$activity_name<-as.factor(trainlabels$activity_name)
levels(trainlabels$activity_name) <- activitylabels$activity_name

## reading id information of participants in train dataset

subjecttrain<-read.table("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
colnames(subjecttrain)<-c("subject_id")
subjecttrain$subject_id<-as.factor(subjecttrain$subject_id)

## reading train set variables data

trainset<-read.table("./data/UCI HAR Dataset/train/x_train.txt", header=FALSE)

## adding colnames to 'trainset' and binding subject info and activity info to train data set 'trainset'

colnames(trainset)<-features[1:dim(coldata)[1]]
trainset<-cbind(trainset,trainlabels)
trainset<-cbind(trainset,subjecttrain)

#######################################################################################
## 'trainset' dataset ready!!
#######################################################################################



#######################################################################################
## Begin Project course requirements section
#######################################################################################


## 1. Merges the training and the test sets to create one data set.

train_test_data<-rbind(testset, trainset)
activityname <-train_test_data$activity_name
subjectid <- train_test_data$subject_id


## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

meandevdata <- train_test_data[, grep("mean\\(\\)|std", colnames(train_test_data))]


## 3.Uses descriptive activity names to name the activities in the data set
##  - already done while preparing test and train datasets


## 4.Appropriately labels the data set with descriptive variable names.
## I opted to not change the variable names too much. The descriptive format is clear enough
## I just took off the "()" and "-" to avoid conflicts in R.
## also fixed a little mispelling.

varnames<-colnames(meandevdata)
varnames<-gsub("\\(","", varnames)
varnames<-gsub("\\)","", varnames)
varnames<-gsub("-",".", varnames)
varnames<-gsub("BodyBody","Body", varnames)

colnames(meandevdata)<-varnames


## 5.Creates a second, independent tidy data set 'avg_data'
##   with the average of each variable for each activity and each subject. 

avg_data<-aggregate(meandevdata, by=list(activityname,subjectid),FUN=mean)

names(avg_data)[names(avg_data) == 'Group.1'] <- "activity_name"
names(avg_data)[names(avg_data) == 'Group.2'] <- "subject_id"


# - ordered resulting 'avg_data' dataset by activity and subject_id in numeric order
# - generated output file 'tinydata.txt' in 'data' folder 

avg_data <-with(avg_data, avg_data[order(activity_name, as.numeric(as.character(subject_id))),])
write.table(avg_data ,row.names = FALSE, col.names = TRUE, file="./data/tidydata.txt")

