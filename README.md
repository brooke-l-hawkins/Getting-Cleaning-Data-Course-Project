==================================================================
Getting & CLeaning Data Course Project: Tidy Dataset
Brooke L. Hawkins
January 2019
==================================================================

This Project
============
This course project was carried out as part of the Coursera class, "Getting and Cleaning Data" from John Hopkins University. The scope of my project was to combine, tidy, and summarize data from another dataset.


Original Dataset
================
The dataset I used is from UC Irvine's Machine Learning Repository. Here is a useful description of the experiment they ran to collect this data, copied from their codebook:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

To read the resesarch paper this dataset was published with, look for:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

To learn more about the original dataset, visit:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

To download the original dataset, visit:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


New Dataset
===========
This new dataset includes the following files:
- 'README.md': Describes the background of this project and files included
- 'CodeBook.md': Describes the data, variables, and transformations performed on the UCI dataset to get the tidy dataset
- 'run_analysis.R': The script that transforms the UCI dataset into the tidy dataset
- 'tidy.txt': The tidy dataset


Setup Notes
===========
Before running the run_analysis.R script successfully, you need to...
1. download the original UCI dataset (see link above)
2. update the directories to match your file system (see variables ending with '.dir' in run_analysis.R)
3. download the library 'dplyr' from CRAN

