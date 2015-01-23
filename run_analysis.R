# GETTING AND CLEANING DATA PROJECT
# Author: Francisco Morales
# Version: 1.0
# class: getdata-010
# 2015/01/23
#################################################

# Summary:
# This script performs the necessary transformations for tidying the data 
# as required in project tasks.

# Notes:
# This script must be along with "./data" directory in the same path

###############################################################################
#
# 1. Merges the training and the test sets to create one data set.
#
###############################################################################

library(data.table)

# Defining function setLabel()
# Arguments: relative txt file  URLs for: subject labels, activity labels, and 
# features' data (X_train or X_test)
# Returns: labeled data set

setIdLabel <- function(subject_file, activity_file, feature_file){
   
    # Reading train set, activity and subject labels into R variables
    
    subject_ID <- read.table(subject_file, stringsAsFactors = FALSE)
    activity_ID <- read.table(activity_file, stringsAsFactors = FALSE)
    feature <- read.table(feature_file, stringsAsFactors = FALSE)
         
    # Combining train set with its subject and activity labels' IDs
    
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

# Merging train and test sets. 
# complete_DT already contains subject and activity ID labels

complete_DT <- rbind(train_DT, test_DT)

# Naming columns according to features.txt file

feat_label <- read.table("./data/features.txt", stringsAsFactors = FALSE, sep = " ")
setnames(complete_DT, old = 1:dim(complete_DT)[2], new= c("subject_ID", "activity_ID", feat_label[,2]))

###################################################################################################
#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
###################################################################################################

# Extracting mean and standard deviation measurements while keeping activity and subject IDs
library(dplyr)
extract_DT <- select(complete_DT,1,2,matches("mean\\(|std\\(", ignore.case = FALSE))

# Set activity_ID as factors 
extract_DT$activity_ID <- as.factor(extract_DT$activity_ID)

#########################################################################################
#
# 3. Uses descriptive activity names to name the activities in the data set
#
#########################################################################################

# Replacing the factor numeric levels for descriptive activity names from activity_labels.txt file
activity_labels <- fread("./data/activity_labels.txt", stringsAsFactors = FALSE)
levels(extract_DT$activity_ID) <- activity_labels$V2
setnames(extract_DT, colnames(extract_DT)[2], "activity")

#########################################################################################
#
# 4. Appropriately labels the data set with descriptive variable names.
#
#########################################################################################

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

#########################################################################################
#
# 5. Tidy data set with average for each activity and subject
#
##########################################################################################

tidy_DT <- extract_DT[,lapply(.SD, mean), by=c("subjectID", "activity")]
tidy_DT <- tidy_DT[order(-subjectID, activity, decreasing = TRUE)]
setnames(tidy_DT, old = 3:dim(tidy_DT)[2], new=gsub("$","Mean", colnames(tidy_DT)[3:dim(tidy_DT)[2]]))

# Saving tidy data set as txt file
write.table(tidy_DT, "./tidy_DT.txt", row.names = FALSE)
