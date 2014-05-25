##Week 3 R script file
##Set working directory
setwd("D:\\GCDWeek3")

#Load libraries
library(sqldf)
library(plyr)
library(reshape)
library(reshape2)

##Load and subset test data
d.xtestimp <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
d.xtest <- d.xtestimp[,1:6]
d.ytest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
d.stest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

##Load and subset train data
d.xtrainimp <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
d.xtrain <- d.xtrainimp[,1:6]
d.ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
d.strain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

##Load misc meta data and add column names
d.features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
d.activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
colnames(d.activities) <- c("activityid","activityname")

##Bind the test data frames and add column names
d.test <- cbind(d.xtest,d.ytest,d.stest)
colnames(d.test) <- c("mnBodyAccx","mnBodyAccy","mnBodyAccz","sdBodyAccx","sdBodyAccy","sdBodyAccz","activityid","subjectid")

##Bind the train data frames and add column names
d.train <- cbind(d.xtrain,d.ytrain,d.strain)
colnames(d.train) <- c("mnBodyAccx","mnBodyAccy","mnBodyAccz","sdBodyAccx","sdBodyAccy","sdBodyAccz","activityid","subjectid")

##Bind the train and test data frames
d.data <- rbind(d.test,d.train)

##Add the Activity names as new column
d.merge <- merge(d.data,d.activities,by="activityid")

##Write merged tidy data frame to txt file
write.table(d.merge,"UCI_HAR_data.txt",sep=",")


##Summarize merge data by activity, subject, variable
##Reshape merge data to prep for cast operation
d.melt <- melt(d.merge, id = c("activityid","activityname","subjectid"))
##drop activityid variable
d.melt1 <- d.melt[,c("activityname","subjectid","variable","value")]
##update column names
colnames(d.melt1) <- c("activityname","subjectid","variablename","variablevalue")

#cast data to return mean for all variables
d.dcast <- dcast(d.melt1,subjectid+activityname~variablename,fun.aggregate=mean)

##Write aggregated data to txt file
write.table(d.dcast,"UCI_HAR_mean.txt",sep=",")





