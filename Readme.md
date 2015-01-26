## Getting and cleaning data project

This repository is part of Coursera - Getting and Cleaning Data course project. 
It uses "Human Activity Recognition Using Smartphones Data Set" 
information to create a new tidy date set according to project instructions.  

Included files/scripts:

- `Readme.md`. This readme file.
- `run_analysis.R`. R script.
- `CodeBook.md`. Description of variables, data and transformations.

### run_analysis.R script

`run_analysis.R` script uses "Human Activity Recognition Using Smartphones Data Set" 
information to create a new tidy date set according to Coursera - Getting and 
Cleaning Data course project.

`run_analysis.R` identifies subject and activity in train and test observations, 
then puts train and test data together. This script isolates mean an standard 
deviation measurements and assigns descriptive names to variables. It calculates 
the average of each measurement aggregating it by activity for every subject. Finally, 
it saves the resulting tidy data set on a file.

This script must be placed in the same path as `./data` directory.

Input files:

from `./data/` directory: 
  * features.txt
  * activity_labels.txt
  
from `./data/train/` directory:  
  * X_train.txt
  * y_train.txt
  * subject_train.txt
  
from `./data/test/` directory:
  * X_test.txt
  * y_test.txt
  * subject_test.txt

Output file:

  * tidy_DT.txt

### CodeBook.md

This document describes the transformations `run_analysis.R` script performs over 
train and test data sets in order to get a processed tidy data to save it to a txt file.
The variables and observations from the resulting tidy data set are also described including their ranges.