# Download data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("UCI HAR Dataset")) {
    download.file(fileUrl, destfile = "Project_dataset.zip", method = "curl")
    unzip("Project_dataset.zip")
    dateDownloaded <- date()
}

# Read in data
activity_labels <- read.table(file="./UCI HAR Dataset/activity_labels.txt")
variable_list <- read.table(file="./UCI HAR Dataset/features.txt")

X_train <- read.table(file="./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table(file="./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table(file="./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table(file="./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table(file="./UCI HAR Dataset/test/subject_test.txt")

# Combine train and test dataset
data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Write descriptive names for variables
# names(data) <- variable_list[,2]


# Extracts only the measurements on the mean and standard deviation for each measurement
select_variable <- sort(c(grep("-mean\\(\\)", variable_list[,2]),grep("-std\\(\\)", variable_list[,2])))
select_data <- data[,select_variable]

# Uses descriptive activity names to name the activities in the data sets
variable_list[,2] <- gsub("\\(\\)", "", variable_list[,2]) # remove "()" to make syntactically valid names
names(select_data) <- variable_list[select_variable,2]
activity_data <- activity_labels[y_data[,1],2]
select_data <- data.frame(subject_data, activity_data, select_data)
names(select_data)[1:2] <- c("subject","activity")

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

get_tidydata <- function(data, n.subject = 30, activity = activity_labels) {
    tidydata <- data[1:180,] # create a data frame with 30 * 6 rows, and all the columns in sort_data
    for(i in 1:n.subject){ # loop through 30 subjects
        c <- 1
        for(a in as.character(activity[,2])) {
            temp <- data[data$subject == i & data$activity == a,]
            tidydata[(i-1)*length(activity[,2]) + c,] <- c(i,a,colMeans(temp[,3:ncol(data)]))
            c <- c + 1
        }
    }
    tidydata
}

tidydata <- get_tidydata(select_data, 30, activity_labels)
write.table(tidydata, file="tidydata.txt", sep="\t")

