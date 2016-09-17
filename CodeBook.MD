# Code Book for the Assignment on Getting and Cleaning Data. 

Done by Ashwini Sharma for the Assignment on Getting and Cleaning Data Course (part of Data Science Specialization)

## Overview
This Code Book provides additional information about the variables, data and transformations used in this Assignment. 

## Source Data
A full description of the data can be found at the [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):

The Sources data for this assignment can be found at this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):

## Information about the Data Set
The data has been collected from a group of 30 volunteers within a age bracket of 19- 48 years. Each volunteer performed six activities:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


while wearing a smartphone (Samsung Galaxy S II) over their waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

The following information is provided in the data set for each record: 

1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope
3. A 561-feature vector with time and frequency domain variables.
4. Its activity label.
5. An identifier of the subject who carried out the experiment.

## Transformations on the Data Set. 

The following transformations have been done to obtain the final result:

1. Merge the training and the test sets to create one data set.
  - After setting the Working Directory properly the following files are read:
    - features.txt
    - activity_labels.txt
  - The following files are read from the training folder
    - subject_train.txt
    - x_train.txt
    - y_train.txt
  - The following files are read from the test folder
    - subject_test.txt
    - x_test.txt
    - y_test.txt
  - The read data for both training and test are assigned with proper meaningful column names and the merged together to form a single data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
  - We create a logical Vector that contains true for columns that contain either standard deviation or mean values. 
  - This logical vector is then used to filter out the unnecessary columns
3. Use descriptive activity names to name the activities in the data set
  - The data is merged with data read from activity_labels.txt file to assign descriptive names to Activity Types.
4. Appropriately label the data set with descriptive activity names.
  - The column names are appropriate labelled by using the gsub function to replace any occurrance of short forms with a understandable name (eg. t -> time, f -> Freq [frequency], Mag -> Magnitude, std() -> StdDev , mean() -> Mean)
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  - Aggregrate function is used with the tidy data set to aggregrate the values based on activityID and subjectID and calculate the mean for each variable. This tidy data set is then exported.
