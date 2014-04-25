# Code Book for tidy data set

## The original data set

The original data were in a zip file downloaded from this link:

`https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip` 

The zip file will be unzipped into a folder named `UCI HAR Dataset`. Within this folder, there are:

- `activity_labels.txt`: list 6 activities each subject performed
- `features_info.txt`: explains the variables collected in this data set
- `features.txt`: the full list of 561 variables collected in this data set
- `README.txt`: Introduction to the data set
- `test` (folder)
	- `Inertial Signals`: ignored in this project
	- `subject_test.txt`: numerical vector listing the subject number (nrows=2947)
	- `X_test.txt`: the measurements of each variables for each subject performing each activity (nrows=2947)
	- `y_test.txt`: numerical vector listing the activities each subject perform (nrows=2947)
- `train` (folder)
	- `Inertial Signals`: ignored in this project
	- `subject_train.txt`: numerical vector listing the subject number (nrows=7352)
	- `X_train.txt`: the measurements of each variables for each subject performing each activity (nrows=7352)
	- `y_train.txt`: numerical vector listing the activities each subject perform (nrows=7352)

## The tidy data set

The tidy data set was created using run_analysis.R

- The data from train (`X_train.txt`) and test (`X_test.txt`) folder were combine to make one big data set.
- Information about subjects (`y_train.txt` and `y_test.txt`) were also combine and add to the big data under `"subject"` column.
- From the big data set, selected only variables (columns) that has `"mean()"` and `"std()"` in their names. A total of 66 variables were selected.
- The variable (column) names were changed to meet the naming standard in R: removed brackets ().
- The activity variable (`y_train.txt` and `y_test.txt`) were combined and convert into descriptive activity names based on the coding provided in `activity_labels.txt`.
- The tidy data was created by calculate the column means of each variable from each subject at each activity (30 subjects x 6 activities = 180 rows).
