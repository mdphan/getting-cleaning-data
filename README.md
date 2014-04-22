# Getting and Cleaning Data Project

## Aims
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## The data
Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The run_analysis.R script
This is the script to generate the tidy data set (see tidydata.txt).
The script will:

1. Download the source data using the link above (hard coded into the script).
2. Unzip the data file.
3. Merges the training and the test sets to create one data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement. 
5. Uses descriptive activity names to name the activities in the data set
6. Appropriately labels the data set with descriptive activity names. 
7. Creates a tidy data set with the average of each variable for each activity and each subject. 