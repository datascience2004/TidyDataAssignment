#Clean-up the Workspace. 
rm(list=ls())

#Set Working directory to where the dataset was unzipped.
setwd("D:/datascience/CleaningData/Assign/DataSet/UCI HAR Dataset")

# Read in the data from features.txt, activity_labels.txt, and 3 more filese from train folder.

features       <- read.table('./features.txt',header=FALSE) #read features.txt
activityLabels <- read.table('./activity_labels.txt',header=FALSE) #read activity_labels.txt
subjectTrain   <- read.table('./train/subject_train.txt',header=FALSE) #read subject_train.txt
xTrain         <- read.table('./train/x_train.txt',header=FALSE) #read x_train.txt
yTrain         <- read.table('./train/y_train.txt',header=FALSE) #read y_train.txt


# Assigin meaningful column names to the data read in the above section
colnames(activityLabels)  <- c('activityID','activityType')
colnames(subjectTrain)  <- "subjectID"
colnames(xTrain)        <- features[,2] 
colnames(yTrain)        <- "activityID"

# Create the training data set by merging yTrain, subjectTrain, and xTrain
trainingDataSet <- cbind(yTrain,subjectTrain,xTrain)


# Read in the test data set
subjectTest <- read.table('./test/subject_test.txt',header=FALSE) #read subject_test.txt
xTest       <- read.table('./test/x_test.txt',header=FALSE) #read x_test.txt
yTest       <- read.table('./test/y_test.txt',header=FALSE) #read y_test.txt

# Assign meaningful column names to the test data read above
colnames(subjectTest) <- "subjectID"
colnames(xTest)       <- features[,2]
colnames(yTest)       <- "activityID"


# Create the test data set by merging the xTest, yTest and subjectTest data
testDataSet <- cbind(yTest,subjectTest,xTest)

############################################################################################
# STEP 1 for the Assignment- Merges the training and the test sets to create one data set. #
############################################################################################
combinedDataSet <- rbind(trainingDataSet,testDataSet)

# Create a vector for the column names from the combinedDataSet, which will be used
# to select the desired mean and standard deviation columns.
allColumns  <- colnames(combinedDataSet) 

######################################################################################################################
# STEP 2 for the Assignment- Extracts only the measurements on the mean and standard deviation for each measurement. #
######################################################################################################################
#Extract only those columns that contain the values for mean(mean()) and standard deviation(std())

# Create a logicalVector that contains TRUE values for the ID, mean() & stddev() columns and FALSE for others
logicalVector <- (grepl("ID$",allColumns) | grepl("-mean..$",allColumns) | grepl("-std..$",allColumns))


# Subset combinedDataSet based on the logicalVector to keep only desired columns
combinedDataSet <- combinedDataSet[logicalVector == TRUE]

#####################################################################################################
# STEP 3 for the Assignment- Uses descriptive activity names to name the activities in the data set #
#####################################################################################################
activityDescCombinedDataSet <- merge(combinedDataSet,activityLabels,by='activityID',all.x=TRUE)


#################################################################################################
# STEP 4 for the Assignment- Appropriately labels the data set with descriptive variable names. #
#################################################################################################
allColumns  <- colnames(activityDescCombinedDataSet) #Getting names of all columns
allColumns <- gsub("^t","Time",allColumns) #Rename all occurrance of starting character t in column names to Time
allColumns <- gsub("^f","Freq",allColumns) #Rename all occurrance of starting character f in column names to Freq (Frequency)
allColumns <- gsub("Mag","Magnitude",allColumns) #Replace all occurrance of the word "mag" in the column names to Magnitude
allColumns <- gsub("-std..$","StdDev",allColumns) #Replace all occurange of -std() in column names to StdDev (Standard Deviation)
allColumns <- gsub("-mean..$","Mean",allColumns) #Replace all occurange of -mean() in column names to Mean


colnames(activityDescCombinedDataSet) <- allColumns


#We do not need the activityType column for aggregrating. Removing it. 
finalCombinedDataSet  <- activityDescCombinedDataSet[,names(activityDescCombinedDataSet) != 'activityType']

############################################################################################################
# STEP 5 for the Assignment- From the data set in step 4, creates a second, independent tidy data set with #
# the average of each variable for each activity and each subject.                                         #
############################################################################################################

# calculating the mean of each variable by aggregrating data based on activityID and subjectID
finalTidyData    <- aggregate(finalCombinedDataSet[,names(finalCombinedDataSet) != c('activityID','subjectID')],by=list(activityID=finalCombinedDataSet$activityID,subjectId = finalCombinedDataSet$subjectID),mean);

#Now add the activityType as description of activity. 
finalTidyData    <- merge(finalTidyData,activityLabels,by='activityID',all.x=TRUE);

# Export the tidy data set 
write.table(finalTidyData,'./tidyDataSet.txt',row.names=TRUE,sep='\t')










