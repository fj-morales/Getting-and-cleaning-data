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

   *  `activityID` variable was converted to factor. `activityID`. Factor levels
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
   
   *  `tidy_DT` data set contains the observations from `extract_DT` where subjectID then
      activity variables were grouped and `mean()` function was applied to measurement 
	  variables to gather their average.
   *  `tidy_DT` was sorted by subjectID then activity in ascending order.

### Variables

The variables in tidy data set represent the average of the mean and the standard deviation 
measurements for each subject aggregated by activity. The variables comprise time 
and frequecy domains considering X, Y, and Z axis from certain activities carried out 
by some subjects. The original measurements were obtained from smartphones 
accelerometer and gyroscope sensors.

Variables summary:

Note: It is described only X axis variables. The same description applies for Y and Z axes.

* **subjectID**:
  Subject's unique numeric identifier. Discrete range [1:30]
  Unit: integer number
 
* **activity**:
  Activity description.
  Qualitative variable.
  Values:
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING
    
* **timeBodyAccelerationMeanXAverage**: 
  Average of the mean of body acceleration in X axis from time domain. Normalized continuous 
  range [-1:1]. 
  Unit: seconds
  
* **timeBodyAccelerationStandardDeviationXAverage**:
  Average of the standard deviation of body acceleration in X axis from time domain. 
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeGravityAccelerationMeanXAverage**: 
  Average of the mean of gravity acceleration in X axis from time domain. 
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeGravityAccelerationStandardDeviationXAverage**:
  Average of the standard deviation of gravity acceleration in X axis from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyAccelerationJerkMeanXAverage**:
  Average of the mean of body acceleration jerk in X axis from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyAccelerationJerkStandardDeviationXAverage**:
  Average of the standard deviation of body acceleration jerk in X axis from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyGyroMeanXAverage**:
  Average of the mean of body gyro in X axis from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyGyroStandardDeviationXAverage**:
  Average of the standard deviation of body gyro in X axis from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds

* **timeBodyGyroJerkMeanXAverage**:
  Average of the mean of body gyro jerk in X axis from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyGyroJerkStandardDeviationXAverage**:
  Average of the standard deviation of body gyro jerk in X axis from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyAccelerationMagnitudeMeanAverage**:
  Average of the mean of body acceleration magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyAccelerationMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body acceleration magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeGravityAccelerationMagnitudeMeanAverage**:
  Average of the mean of gravity acceleration magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeGravityAccelerationMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of gravity acceleration magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyAccelerationJerkMagnitudeMeanAverage**:
  Average of the mean of body acceleration jerk magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyAccelerationJerkMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body acceleration jerk magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyGyroMagnitudeMeanAverage**:
  Average of the mean of body gyro magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyGyroMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body gyro magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyGyroJerkMagnitudeMeanAverage**:
  Average of the mean of body gyro jerk magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **timeBodyGyroJerkMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body gyro jerk magnitude from time domain.
  Normalized continuous range [-1:1].
  Unit: seconds
  
* **frequencyBodyAccelerationMeanXAverage**:
  Average of the mean of body acceleration in X axis from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyAccelerationStandardDeviationXAverage**:
  Average of the standard deviation of body acceleration in X axis from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyAccelerationJerkMeanXAverage**:
  Average of the mean of body acceleration jerk in X axis from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz

* **frequencyBodyAccelerationJerkStandardDeviationXAverage**:
  Average of the standard deviation of body acceleration jerk in X axis from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz

* **frequencyBodyGyroMeanXAverage**:
  Average of the mean of body gyro in X axis from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz

* **frequencyBodyGyroStandardDeviationXAverage**:
  Average of the standard deviation of body gyro in X axis from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyAccelerationMagnitudeMeanAverage**:
  Average of the mean of body acceleration magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyAccelerationMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body acceleration magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyBodyAccelerationJerkMagnitudeMeanAverage**:
  Average of the mean of body body acceleration jerk magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyBodyAccelerationJerkMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body body acceleration jerk magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyBodyGyroMagnitudeMeanAverage**:
  Average of the mean of body body gyro magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyBodyGyroMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body body gyro magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
 
* **frequencyBodyBodyGyroJerkMagnitudeMeanAverage**:
  Average of the mean of body body gyro jerk magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz
  
* **frequencyBodyBodyGyroJerkMagnitudeStandardDeviationAverage**:
  Average of the standard deviation of body body gyro jerk magnitude from frequency domain.
  Normalized continuous range [-1:1].
  Unit: hertz