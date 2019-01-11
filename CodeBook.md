==================================================================
Getting & CLeaning Data Course Project: Tidy Dataset
Brooke L. Hawkins
January 2019
==================================================================

Summary
=======
This file describes the data, variables, and transformations performed on the UCI dataset to get the tidy dataset.


Files Used from UCI Dataset
===========================
The following files are loaded into R in the run_analysis.R script:
- 'test/X_test.txt': Test set.
- 'train/X_train.txt': Training set.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'test/y_test.txt': Test labels.
- 'train/y_train.txt': Training labels.
- 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.


Transformations in run_analysis.R
=================================
Below is a description of each step. I copied and pasted the steps from the assignment prompt. In the subsequent bullet points, I describe what I did more specifically, and mention any files from the UCI dataset that were involved. These same steps are included as comments in the run_analysis.R script, so feel free to look at the script and this markdown side by side to clarify each step.

STEP 1: Merges the training and the test sets to create one data set.
- Merge data from test set (X_test.txt) and training set (X_train.txt) data.

STEP 2: Extracts only the data on the mean and standard deviation for
each measurement.
- Keep subset of data from step 1 to only include features that refer to the mean or the standard deviation.

STEP 3: Uses descriptive activity names to name the activities in the data set.
- Add activity labels (activity_labels.txt).

STEP 4: Appropriately labels the data set with descriptive variable names.
- Capitalize 'mean' and 'std' to make feature names more easily readable.
- Remove dashes and parentheses to make feature names more concise.
- Correct typo ('BodyBody' to 'Body') to make feature names more concise.
- See notes on feature abbreviations below.

STEP 5: From the data set in step 4, creates a second, independent tidy data 
set with the average of each variable for each activity and each subject.
- Add subject labels (y_test.txt and y_train.txt).
- Group data by subject and activity.
- Find mean for each grouped feature.


Feature Abbreviations
=====================
Feature labels are based on the abbreviations below, which were part of the original UCI dataset. For a more in-depth description, see features_info.txt from the UCI dataset.

- the 't' prefix refers to time-derived signals
- the 'f' prefix refers to frequency-domain signals

- 'Body' refers to the subject's body movements
- 'Gravity' refers to gravity

- 'Acc' refers to accelerometer signals
- 'Gyro' refers to gyroscope

- 'Jerk' refers to jerk signals
- 'Mag' refers to the magnitude of 3-dimnsional signals

- 'Mean' refers to the mean
- 'Std' refers to the standard deviation

- the 'X' suffix refers to motion in the X direction
- the 'Y' suffix refers to motion in the Y direction
- the 'Z' suffix refers to motion in the Z direction

