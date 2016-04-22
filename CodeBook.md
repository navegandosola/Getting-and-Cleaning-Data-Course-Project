#Getting and Cleaning Data Course Project
##by Ana Isabel Lozano Martínez

##Project description:

This project consist on collecting, working with and cleaning a data set to make it tidy and understandable to 
allow anyone interesed to reproduce this work.

##Study Desing and Data Processing:

###Collection of the raw Data:

The data for the project are here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The datasets consist on experiments with a group of 30 volunteers. In this experiments, 
each peerson performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
SITTING, STANDING AND LAYING) wearing a smartphone(Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration
and 3-axial angular velocity at a constant rate of 50 Hz.The obtained dataset was randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training 
data and 30% the test data.
Starting from the raw data (signals measured from the accelerometer and gyroscope) the 
authors applyed several transformations and filters to obtain the features we are going to 
work with.

###Notes on the Original Data:

The files used are:

* X_train.txt: Contains the data from the observed features for diferent activities
carried out by the subject in the train group.
* X_test.txt: Contains the dat from the observed features for diferent activitties
carried out by the ssubject in the test group.
* y_train.txt: Contains a vector of activity labels to relate the observations in "X_train.txt"
* y_test.txt: Contains a vecto of activityy labels to relate the observations in "X_test.txt"
* subject_train.txt: Contains a vector of subject labels given to the subjects chosen to be part 
of the train set and ables to relate the observations in "X_train.txt" to a certain subject.
* subject_test.txt: contains a vector of subject labels given to a subject chosen to be part
of the test set and ables to relate the observations in "X_test.txt" to a certain subject.
* activity_labels.txt: Contains the numeric labels given to the different activities carried out.
* features.txt: Contains the numeric labels given to the features obtained by the authors.

If you want to know information about all the files, you can learn the  file README.txt include
in the data set.

###Creating the Tidy Dataset:

1. Download the data in my workspace.
2. Load the packages plyr and dplyr.
3. Read the data from the files into the variables.
  * xtrain for "X_train.txt"
  * xtest for "X_test.txt"
  * features for "features.txt"
  * ytrain for "y_train.txt"
  * ytest for "y_test.txt"
  * subject_train for "subject_train.txt"
  * subject_test for "subbject_test.txt"
4. Set names to variables.
  * "activity" for ytrain and ytest.
  * "subject" for subject_train and subject_test.
  * The second column of "features.txt" for xtrain and xtest.
5. Merge the training and the test sets to create one data sets.
6. Extract the measurements on the mean and std for each measurement.
7. Use descriptive activity names contains on "activity_labels.txt" to name the activities in data.
8. Label the data with descriptive variable names.
  * "t" for "time".
  * "f" for "frequency".
  * "Acc" for "Accelerometer".
  * "Gyro" for "Gyroscope".
  * "Mag" for "Magnitude".
  * "BodyBody" for "Body".
9. From the data, create a new independent tidy data set with the average for each variable
for each activity and each sbject.

		
