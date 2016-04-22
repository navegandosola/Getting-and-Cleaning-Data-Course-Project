run_analisys <- function()
{
  ## Load Packages:
  library(dplyr)
  library(plyr)
  
  #Read data from the files into the variables

  ##Features files:
  xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
  xtest <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
  features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

  ##Activity files:
  ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
  ytest <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

  ##Subject files:
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

  #Set names to variables

  ##Activities
  names(ytrain) <- c("activity")
  names(ytest) <- c("activity")

  ##Subjects
  names(subject_train) <- c("subject")
  names(subject_test) <- c("subject")

  ##Features
  names(xtrain) <- features$V2
  names(xtest) <- features$V2

  #Merge the training and the test sets to crete one data set

  ##Data train
  data_train <- cbind(subject_train, ytrain, xtrain)

  ##Data test
  data_test <- cbind(subject_test, ytest, xtest)

  ##Data
  data <- rbind(data_train, data_test)

  #Extract the measurements on the mean and std for each measurement

  subdata <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
  selectedNames <- c("subject","activity",as.character(subdata))
  data <- subset(data, select=selectedNames)

  #Use descriptive activity names to name the activities in data

  activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
  levels <- activity_labels$V1
  labels <- activity_labels$V2
  data$activity <- factor(data$activity, levels, labels)
  
  #Label the data with descriptive variable names
  
  names(data) <- gsub("^t", "time", names(data))
  names(data) <- gsub("^f", "frequency", names(data))
  names(data) <- gsub("Acc", "Accelerometer", names(data))
  names(data) <- gsub("Gyro", "Gyroscope", names(data))
  names(data) <- gsub("Mag", "Magnitude", names(data))
  names(data) <- gsub("BodyBody", "Body", names(data))
  
  #From the data, create a new independent tidy data
  #set with the average for each variable for each activity
  #and each subject
  data2 <- aggregate(. ~subject + activity, data, mean)
  data2 <-data2[order(data2$subject, data2$activity),]
  write.table(data2, file = "tidydata.txt", row.names = FALSE)
  
}