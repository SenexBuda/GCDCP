library(dplyr)

## Download and unzip UCI HAR data set
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="UCI_HAR_DataSet.zip")
unzip("UCI_HAR_DataSet.zip")
setwd("./UCI HAR DataSet")

## Read metadata files
activities<-read.table("activity_labels.txt", sep=" ",
                       col.names = c("activity.number","activity.name"))
features<-read.table("features.txt", sep=" ", 
                     col.names = c("feature.number","feature.name"))

## Read test data files
TestActivityLabels<-read.table("./test/y_test.txt", 
                               col.names=c("Activity"))
TestSubjectLabels<-read.table("./test/subject_test.txt", 
                              col.names=c("Subject"))
TestMeasuredData<-read.table("./test/X_test.txt",
                             col.names = features$feature.name)

## Combine test data into single test data set
TestData<-cbind(TestSubjectLabels,TestActivityLabels,TestMeasuredData)

## Read training data files
TrainingActivityLabels<-read.table("./train/y_train.txt", 
                                   col.names=c("Activity"))
TrainingSubjectLabels<-read.table("./train/subject_train.txt", 
                                  col.names=c("Subject"))
TrainingMeasuredData<-read.table("./train/X_train.txt",
                                 col.names = features$feature.name)

## Combine training data into single training data set
TrainingData<-bind_cols(TrainingSubjectLabels,TrainingActivityLabels,
                    TrainingMeasuredData)

## Combine training data and test data into a single data set
CombinedData<-bind_rows(TrainingData,TestData)

## Identify which features are means and standard deviations
means<-grepl("mean\\(",features$feature.name)
stds<-grepl("std\\(",features$feature.name)
MeansAndStdsColIndexes<-which(means | stds)

## Extract only the features that are means and standard deviations of measurements
CombinedMeanStdData<-select(CombinedData,
                            c(Subject,Activity,
                              2+MeansAndStdsColIndexes))

## Use the readable activity label instead of the cryptic activity number
CombinedMeanStdData<-mutate(CombinedMeanStdData,
                            Activity=activities$activity.name[Activity])

## Enhance feature names to decrypt the feature components and make names consistent with R data frame column naming standards
enhancedNames<-features$feature.name[means | stds]
enhancedNames<-sub("-mean\\(\\)","Mean.",enhancedNames)
enhancedNames<-sub("-std\\(\\)","StdDev.",enhancedNames)

enhancedNames<-sub("^t","Time.", enhancedNames)
enhancedNames<-sub("^f","Frequency.", enhancedNames)

enhancedNames<-sub("AccJerk","LinearJerk.", enhancedNames)
enhancedNames<-sub("GyroJerk","AngularJerk.", enhancedNames)
enhancedNames<-sub("Acc","LinearAcceleration.", enhancedNames)
enhancedNames<-sub("Gyro","AngularVelocity.", enhancedNames)

enhancedNames<-sub("BodyBody","Body", enhancedNames)
enhancedNames<-sub("Body","BodyMotion.", enhancedNames)
enhancedNames<-sub("Gravity","Gravity.", enhancedNames)

enhancedNames<-sub("-X","X", enhancedNames)
enhancedNames<-sub("-Y","Y", enhancedNames)
enhancedNames<-sub("-Z","Z", enhancedNames)
enhancedNames<-sub("Mean.X","X.Mean", enhancedNames)
enhancedNames<-sub("Mean.Y","Y.Mean", enhancedNames)
enhancedNames<-sub("Mean.Z","Z.Mean", enhancedNames)
enhancedNames<-sub("StdDev.X","X.StdDev", enhancedNames)
enhancedNames<-sub("StdDev.Y","Y.StdDev", enhancedNames)
enhancedNames<-sub("StdDev.Z","Z.StdDev", enhancedNames)
enhancedNames<-sub("X","XComponent", enhancedNames)
enhancedNames<-sub("Y","YComponent", enhancedNames)
enhancedNames<-sub("Z","ZComponent", enhancedNames)

enhancedNames<-sub("MagMean.","Magnitude.Mean", enhancedNames)
enhancedNames<-sub("MagStdDev.","Magnitude.StdDev", enhancedNames)

## Use enhanced column names for data set
names(CombinedMeanStdData)<-c("Subject","Activity",enhancedNames)

## Create new tidy data set containing the averages of all mean and standard
## deviation features for each subject and activity
CombinedGroupedData<-group_by(CombinedMeanStdData,Subject,Activity)
TidySummarizedDataSet<-summarize_all(CombinedGroupedData, funs(mean))
write.table(TidySummarizedDataSet,file="UCI_HAR_Average_Means_And_StdDevs.txt",row.names=FALSE)
