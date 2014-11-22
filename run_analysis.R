
######################################################################################################
##
## run_analysis.R - R source code 
## This code file contains the run down of R commands used to merge the two data and write the mean and
## std of variable parameters for each subject and for each activity
## This program corresponds to Course Project of 
## course 
## "Getting and Cleaning Data" 
##  by Dr.Jeff Leek, Dr.Roger D. Peng,  Dr.Brian Caffo
## : https://class.coursera.org/getdata-009
#######################################################################################################
##       
## Last modified: boloramji 11/21/2014
##
#######################################################################################################

## Step 1: Read all the test and training data files and the measurement and their labels 
## data is two separate sets training and test data sets
library(data.table)
X_train <- read.table("./train/x_train.txt")
y_train <- read.table("./train/y_train.txt")
X_test <- read.table("./test/x_test.txt")
y_test <- read.table("./test/y_test.txt")
## featuresL contains all the variable names of the 561 parameters
featuresL <- read.table("./features.txt",stringsAsFactors =FALSE)
activity_labels <- read.table("./activity_labels.txt")
sub_train <- read.table("./train/subject_train.txt")
sub_test <- read.table("./test/subject_test.txt")
## first append each of the test datasets to training data sets thru row binding
X_traintest <- rbind(X_train,X_test)
y_traintest <- rbind(y_train,y_test)
sub_traintest <- rbind(sub_train,sub_test)
## Add the column names to these dataset which will be later used for filtering and merging activities
colnames(y_traintest) <- c("activity")
colnames(sub_traintest) <- c("subject")
colnames(activity_labels) <- c("activity","activity_label")
colnames(X_traintest) <- featuresL[,2]
## we need to filter the coumns and have only with mean and std() names 
colPattern1 <- "mean()|std()"
X_final <- X_traintest[,grepl(colPattern1,colnames(X_traintest))][,]
## X_final contains the  subset of X observations with columns names having mean or std in their name
## add the subject and activity for these X measurements thru column binding
Xy_final <- cbind(sub_traintest,y_traintest,X_final)
##  we need to add desriptive activity labels to all the observations thru merge command 
Xy_finalact <- merge(activity_labels,Xy_final,by.x="activity",by.y="activity")
## we will use plyr library for grouping by subject and activity. 
## Please note: activity_lable is added to grouping for the purpose of showing descriptive column name
library(plyr)
Xy_tidySummary <- ddply(Xy_finalact,c("subject","activity","activity_label"),function(df) colMeans(df[,4:82]))
## now write the table to local disk
write.table(Xy_tidySummary,"har_meanstdsum.txt",row.name=FALSE)
## now clean the memory by freeing all objects we created
rm(list=ls(all=TRUE))
## end of the R program
