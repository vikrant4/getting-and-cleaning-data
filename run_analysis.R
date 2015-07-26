## This script returns a data set having average values of each variable for each
## activity and each subject after combing the training and testing data sets and
## giving each variable proper descriptive names.

## For the ddply functionh
library(plyr)

## Read training dataset
train_X <- read.table("UCI HAR Dataset/train/x_train.txt")
train_label <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Read testing dataset
test_X <- read.table("UCI HAR Dataset/test/x_test.txt")
test_label <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Step 1: Merging data
data <- rbind(train_X, test_X)
rm(train_X, test_X)

## labels and features
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Step 2: Extract mean and standard deviation
extract_columns <- grep("mean()|std()", features[,2])
data <- data[,extract_columns]

## Step 4: Removing non-alphabetic symbols to make feature names more readable
read_features <- sapply(features[, 2], function(x) gsub("[()]", "", x))
read_features <- sapply(read_features, function(x) gsub("[-,]", "_", x))
read_features <- sapply(read_features, function(x) gsub('^t', 'timeDomain', x))
read_features <- sapply(read_features, function(x) gsub('^f', 'frequencyDomain', x))
read_features <- sapply(read_features, function(x) gsub('Acc', 'Acceleration', x))
read_features <- sapply(read_features, function(x) gsub('Mag', 'Magnitude', x))
read_features <- sapply(read_features, function(x) gsub('mean', 'Mean', x))
read_features <- sapply(read_features, function(x) gsub('std', 'stdDev', x))
names(data) <- read_features[extract_columns]
rm(features, read_features, extract_columns)

## Step 3: Adding subject and activity fields
data$subject <- c(train_subject[,1], test_subject[,1])
data$activity <- c(train_label[,1], test_label[,1])
data$activity <- sapply(data$activity, function(x) activity_labels[x, 2])

## Step 5: independent tidy data set with the average of each variable for 
## each activity and each subject
avgs <- ddply(data, .(subject, activity), function(x) {
    cols <- !names(x) %in% c("activity", "subject")
  apply(x[, cols], 2, function(y) mean(as.numeric(y)))
} )

write.table(avgs, "tidy_data.txt")