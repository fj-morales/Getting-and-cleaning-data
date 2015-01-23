# GETTING AND CLEANING DATA PROJECT
# Author: Francisco Morales
# Version: 1.0
#################################################

#
# Summary:
# 1. Define function setLabel() to combine the features set wih its corresponging 
#    subject and activity ID labels
# 2. Apply function setLabel() to train and test sets
# 3. Merge train and test labeled sets

# Notes:
# This script must be in the same directory as ./data

# Defining function setLabel()
# Arguments: relative txt file  URLs for: subject labels, activity labels, and 
# features' data (X_train or X_test)
# Returns: labeled data set
# 
#


library(data.table)
setIdLabel <- function(subject_file, activity_file, feature_file){
    # Reading train set, activity and subject labels into R variables
    
    subject_ID <- read.table(subject_file, stringsAsFactors = FALSE)
    activity_ID <- read.table(activity_file, stringsAsFactors = FALSE)
    feature <- read.table(feature_file, stringsAsFactors = FALSE)
    
        
    # Combining train set with its labels' IDs
    
    labeled_set <- cbind(subject_ID, activity_ID, feature)
    
    # To make things faster
    labeled_set <- data.table(labeled_set)
    
    # Cleaning memory from old variables 
    rm(subject_ID, activity_ID, feature)
    
    return(labeled_set)
}

# ID labelling train data set

train_DT <- setIdLabel("./data/train/subject_train.txt", "./data/train/y_train.txt", 
         "./data/train/X_train.txt")

# ID labelling test data set

test_DT <- setIdLabel("./data/test/subject_test.txt", "./data/test/y_test.txt", 
                      "./data/test/X_test.txt")

# Merging train and test sets

complete_DT <- rbind(train_DT, test_DT)

# Naming columns according to features.txt file

feat_label <- read.table("./data/features.txt", stringsAsFactors = FALSE, sep = " ")
setnames(complete_DT, old = 1:dim(complete_DT)[2], new= c("subject_ID", "activity_ID", feat_label[,2]))

# Extracting mean and standard deviation measurements while keeping activity and subject IDs
library(dplyr)
extract_DT <- select(complete_DT,1,2,matches("mean\\(|std\\(", ignore.case = FALSE))

# Set activity_ID as factors 
extract_DT$activity_ID <- as.factor(extract_DT$activity_ID)

# Replacing the factor numeric levels for descriptive activity names from activity_labels.txt file
activity_labels <- fread("./data/activity_labels.txt", stringsAsFactors = FALSE)
levels(extract_DT$activity_ID) <- activity_labels$V2
setnames(extract_DT, colnames(extract_DT)[2], "activity")

# Descriptive Variable names
#gsub("_|-|\\(\\)","", colnames(extract_DT))

# Removing special characters
setnames(extract_DT, old = 1:dim(extract_DT)[2], new=gsub("_|-|\\(\\)","", colnames(extract_DT)))

# Verbose names instead of abbreviations or ambiguos names
setnames(extract_DT, colnames(extract_DT)[2], "activity")
setnames(extract_DT, old = 1:dim(extract_DT)[2], new=gsub("^t","time", colnames(extract_DT)))
setnames(extract_DT, old = 1:dim(extract_DT)[2], new=gsub("^f","frequency", colnames(extract_DT)))
setnames(extract_DT, old = 1:dim(extract_DT)[2], new=gsub("Acc","Acceleration", colnames(extract_DT)))
setnames(extract_DT, old = 1:dim(extract_DT)[2], new=gsub("std","StandardDeviation", colnames(extract_DT)))
setnames(extract_DT, old = 1:dim(extract_DT)[2], new=gsub("Mag","Magnitude", colnames(extract_DT)))
setnames(extract_DT, old = 1:dim(extract_DT)[2], new=gsub("mean","Mean", colnames(extract_DT)))

# Tidy data set with average for each activity and subject

tidy_DT <- extract_DT[,lapply(.SD, mean), by=c("subjectID", "activity")]
tidy_DT <- tidy_DT[order(-subjectID, activity, decreasing = TRUE)]
setnames(tidy_DT, old = 3:dim(tidy_DT)[2], new=gsub("$","Mean", colnames(tidy_DT)[3:dim(tidy_DT)[2]]))

# Saving tidy data set as txt file
write.table(tidy_DT, "./tidy_DT.txt", row.names = FALSE)
