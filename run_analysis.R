setwd ("C:/Users/pramirez/Documents/Data Science Specialization/GettinNcleaning")

# libraries
library(dplyr)
library(plyr)

# Download files and decompress it into a folder 
if(!file.exists("./data")){dir.create("./data")}
dataset_URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_URL,destfile="./data/dataset_GnC.zip")
unzip("./data/dataset_GnC.zip")

# obtaining the .csv files
list.files()
list.files("./UCI HAR Dataset")
list.files("./UCI HAR Dataset/test")
list.files("./UCI HAR Dataset/train")

# A) Merging the training and the test datasets into only one.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## combine the test and training sets with the corresponding labels and subject
## the merge the test datasets to create only one
colnames(Y_test) <- "label"; colnames(Y_train) <- "label";
colnames(subject_train) <- "subject"; colnames(subject_test) <- "subject";
colnames(activity_labels) <- c("label", "activity") 
data.values <- rbind(X_train, X_test)
data.labels <- rbind(Y_train, Y_test)
data.subjects <- rbind(subject_train, subject_test) 

# B) Extract the measurements and the mean and standard deviation for each one

feature_names <- read.table("./UCI HAR Dataset/features.txt")[,2]

## get columns with mean() or std() in the names, use them as indexes since 
## features were sorted numerically
mean.sd.features <- grep("mean|std", feature_names)
data.values.mean.sd <- data.values[,mean.sd.features]
colnames(data.values.mean.sd) <- data.values[mean.sd.features,2]


# C) Use descriptive activities as names of the activities in the dataset
data.labels <- activity_labels[data.labels$label,]


# D) Label the dataset with variable names. 
data <- cbind(data.subjects, data.labels, data.values.mean.sd)
data <- data[,-2]


# E) From the dataset in previous step, create a second tidy dataset 
# with the average of each variable for each activity and each subject.

finalset <- ddply(data, .(subject, activity), function(x) colMeans(x[,3:81]))
finalset <- arrange(final, subject)

write.table(finalset, "tidy_dataset.txt", row.name=F)
