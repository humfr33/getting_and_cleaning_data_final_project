# Coursera Getting and Cleaning Data Course Project

Wearable computing is currently a huge source of interesting data for data scientists to analyse. In light of this, for this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, cleaned and tidied for further downstream analysis.

This repository contains the following files:

* README.md, this file, which contains a discussion of the data set and how analysis was performed.
* tidy_data.txt, which contains the tidied data set.
* CodeBook.md, which describes the contents of the tidy data set.
* run_analysis.R, the R script that was used to create the tidy data set

## Study design

From the source data set, the measurements of the mean and standard deviation were extracted for each measurement and the training and test data were merged together to create a unified data set. Then the measurements were averaged for each subject and activity, resulting in the final data set.

## Creating the data set

The R script 'run_analysis.R' can be used to tidy the source data set. It retrieves the source data set if it has not already been downloaded; checks to see if the required packages are installed and if not, installs them and uses the following steps to tidy the source data:
    
* Checks to see if the required packages are installed and if not installs them
* Loads the required packages
* Downloads and unzip source data if it doesn't exist.
* Reads in the features and activites data.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Renames the activities in the data set using more descriptive names.
* Reads in the training and test data.
* Merges the data together.
* Creates a second tidy data set containing the average of each variable for each activity and each subject.
* Writes the new data set to the 'tidy_data.txt' file.
    
The 'tidy_data.txt' in this repository was created by running the 'run_analysis.R' script using R version 3.5.1 (2018-07-02) on Windows 7 64-bit edition.

This script requires the dplyr package (version 0.7.7 was used).