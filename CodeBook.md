### Codebook

This document describes the necessary transformations and variables contained in the 
tidy data set according to project's instructions.

### Transformations: tidying data set

1. Merges the training and the test sets to create one data set.

   * `setLabel()` function relates subject and activity IDs with their corresponding 
      observations contained in train and test data sets.
   * Once identified subject and activity IDs, train and test sets were binded into a 
     new data set called `complete_DT`. Train data is on top.
 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 

   *  To extract mean and standard deviation measurements, `complete_DT` was filtered selecting 
   only the columns names that contain "mean()" and "std()" strings. The resulting 
   data became `extract_DT` data set.
   
3. Uses descriptive activity names to name the activities in the data set

   *  To make things faster and easier, activity IDs were converted to factors. Activity 
   variable IDs were replaced by activity_labels.txt descriptive names. 
   
4. Appropriately labels the data set with descriptive variable names. 

   * All special characters were removed from varible names.
   * All abbreviations were replaced by complete words on variable names.
   * All words in column names, except first, were capitalized to ease 
   readibility.

5. From the data set in step 4, creates a second, independent tidy data set 
   with the average of each variable for each activity and each subject. 
   
   *  To create tidy data set observations on extracted data were grouped by 
   subjectID then activity. mena() function was applied to all left columns
   to gather their average.
   *  The resulting `tidy_DT` data set was sorted by subject then activity descending
   order.

### Variables