## The script run_analysis is used to tidy a dataset collected using Samsung
## Galaxy S smartphones. This script has five parts which are detailed more 
## completely in README.md

library(plyr)
library(dplyr)
library(tidyr)
    
## Set paths to files with data of interest
test_data_path <- "UCI HAR Dataset/test/"
train_data_path <- "UCI HAR Dataset/train"

## Read in data and labels
test_data <- read.table(paste(test_data_path, "/X_test.txt", sep=""))
test_data_labels <- read.table(paste(test_data_path, "/y_test.txt", sep=""))
test_data_subjects <- read.table(paste(test_data_path, "/subject_test.txt", sep=""))
train_data <- read.table(paste(train_data_path, "/X_train.txt", sep=""))
train_data_labels <- read.table(paste(train_data_path, "/y_train.txt", sep=""))
train_data_subjects <- read.table(paste(train_data_path, "/subject_train.txt", sep=""))

# Read in features list 
featuresDF <- read.table("UCI HAR Dataset/features.txt")

# Read in activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Assign the feature names to the test and train DFs
colnames(test_data) <- featuresDF[,2]
colnames(train_data) <- featuresDF[,2]

# Subset the mean and std data from the original datasets
std_mean_bool <- grepl("mean[^F]", colnames(test_data)) | grepl("std[^F]", colnames(test_data))
test_data <- test_data[,std_mean_bool]
train_data <- train_data[,std_mean_bool]

# Merge the data subjects into the data datasets. This is another variable
test_data <- cbind(test_data_subjects,test_data_labels,test_data)
train_data <- cbind(train_data_subjects, train_data_labels, train_data)

# Merge the test and train datasets together
all_data <- rbind(test_data, train_data)

# Name the Subject Id column
colnames(all_data)[1] <- c("subjectid")
colnames(all_data)[2] <- c("activity")

# Add the activity lables
for (item in activityLabels[,1]) {all_data[,2]<-gsub(item,activityLabels[item,2],all_data[,2])}

# Group the Data by Activity and Subject Id
grouped_data <- all_data %>% group_by(subjectid, activity)

# Now Compute the Average of each variable in the grouped_by table and summarize the data
# There should be one row for each combination of activity and subject id (6*30=180)
# To do this I will use the sumarize_all function to apply the mean() function to each column
average_data <- averages <- summarise_all(grouped_data,mean)

# Write the tidy dataset to a file for uploading to GitHub
write.csv(average_data, "./average_data.csv")


