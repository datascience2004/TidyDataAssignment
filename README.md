# Getting and Cleaning Data Assignment

Repository for assignment for Getting and Cleaning Data Course as a part of Data Science Specialization 
Assignment is done by Ashwini Sharma

## Overview
The assignment here makes and assumption that the data has already been downloaded and extracted into some directory. This assignment demonstrates cleaning of a dataset which has been formed by a series of transformations from multiple data sets. 
It also demonstrates the analysis by calculating the mean values of several variables in a tidy data set 

A full description of the data can be found at the [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones): 


The Sources data for this assignment can be found at this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):


## Modifying run_analysis.R file
Once the data has been downloaded and extracted, there needs to be done a small modification in run_analysis.R file. 
Line Number 5 of the file needs to set the Working Directory Correctly. 


## Project Summary
The run_analysis.R file does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Additional Information
Additional Information about the assignment can be found in the file CodeBook.MD
