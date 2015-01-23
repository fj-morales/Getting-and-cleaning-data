## Readme.md - Getting and cleaning data project
### Tidy data set

In this document are described the necessary transformations for tidying 
"Human Activity Recognition Using Smartphones Data Set" according project's 
instructions as follow:

* Merges the training and the test sets to create one data set.

1. setLabel() function combines train or test data set with its corresponding subject
   and activity label IDs in order to create a new data set containing complete observations
   for each subject.
   
2. Labeled train and test data were binded into a complete data set by rows, with train data on top.
 
* Extracts only the measurements on the mean and standard deviation for each measurement. 

1.  To extract mean and standard deviation measurements, complete data set was filtered
   by column names containing only "mean()" and "std()" strings. It was created an extracted data set
   
* Uses descriptive activity names to name the activities in the data set

1.  To make things faster and easier, activity IDs were converted.Activity 
   variable IDs were replaced by activity_labels.txt descriptive names. 
   
* Appropriately labels the data set with descriptive variable names. 

1. All special characters were removed from varible names.
2. All abbreviations were replaced by complete words on variable names.
3. All words in column names, except first, were capitalized to ease 
   readibility.

5. From the data set in step 4, creates a second, independent tidy data set 
   with the average of each variable for each activity and each subject. 
   
*  To create tidy data set observations on extracted data were grouped by 
   subjectID then activity. mena() function was applied to all left columns
   to gather their average.
*  The resulting tidy data set was sorted by subject then activity descending
   order.
   





### Codebook

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeVector` creates a special "vector", which is
really a list containing a function to

1.  set the value of the vector
2.  get the value of the vector
3.  set the value of the mean

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
