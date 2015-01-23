## Codebook

This document describes the necessary transformations and variables contained in the 
tidy data set according to project's instructions.

### Transformations: tidying data set

1. Merges the training and the test sets to create one data set.

   * `setLabel()` function relates subject and activity IDs with their corresponding 
      observations contained in train and test data sets.
   * Once identified subject and activity IDs, train and test sets were binded into a 
     new data set called `complete_DT`. Train data is on top.
   * `complete_DT` first two columns were named subjectID and activityID respectively. 
     The remaining columns were named based on `features.txt` labels keeping the same order.
 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

   *  To extract mean and standard deviation measurements, `complete_DT` was filtered selecting 
   only the columns that contain "mean()" and "std()" in their names. The resulting 
   data set became `extract_DT`.
   
3. Uses descriptive activity names to name the activities in the data set

   *  `activityID` variable was converted to factor. `activityID` factor levels
      were replaced with `activity_labels.txt` descriptive names. 
   
4. Appropriately labels the data set with descriptive variable names. 
  
  On `extract_DT`
  
   * `activityID` variable was renamed just as `activity`.
   * All special characters were removed from varible names.
   * All abbreviations were replaced by complete words on variable names.
   * All words in column names, except the first one, were capitalized to ease 
   readibility.

5. From the data set in step 4, creates a second, independent tidy data set 
   with the average of each variable for each activity and each subject. 
   
   *  `tidy_DT` data set contains the observations from `extract_DT` where subjectID then activity 
      variables were grouped and `mean()` function was applied to measurement variables
      to gather their average.
   *  `tidy_DT` was sorted by subjectID then activity in ascending order.

### Variables