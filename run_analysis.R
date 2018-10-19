# When run, this script produces a tidy data set from the raw data obtained from the accelerometers from 
# the Samsung Galaxy S smartphone and output the resulting tidy data to an output file "tidy_data.txt"

# Checks to see if required packages are installed and if not installs them

list_of_packages <- c("dplyr")
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]
if (length(new_packages) != 0){
        install.packages(new_packages)
}

# Loads the required packages 

library("dplyr") 

# Checks to see if the data set exists and if not, downloads and unzips it:

file_name <- "getdata_dataset.zip"

if (!file.exists(file_name)){
        file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(file_URL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# Loads the activity names and features

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

# Converts the names and features to character vetcors

activity_labels[,2] <- as.character(activity_labels[,2])
features[,2] <- as.character(features[,2])

# Extracts the mean and standard deviations from the features data frame

features_meanstd_pos <- grep(".*mean.*|.*std.*", features[,2])
features_meanstd_names <- features[features_meanstd_pos,2]

# Performs String formatting to make names more descriptive 

features_meanstd_names <- gsub("^f", "frequencyDomain", features_meanstd_names)
features_meanstd_names <- gsub("^t", "timeDomain", features_meanstd_names)
features_meanstd_names <- gsub("Acc", "Accelerometer", features_meanstd_names)
features_meanstd_names <- gsub("Gyro", "Gyroscope", features_meanstd_names)
features_meanstd_names <- gsub("Mag", "Magnitude", features_meanstd_names)
features_meanstd_names <- gsub("Freq", "Frequency", features_meanstd_names)
features_meanstd_names <- gsub("mean", "Mean", features_meanstd_names)
features_meanstd_names <- gsub("std", "StandardDeviation", features_meanstd_names)

# Corrects a typo

features_meanstd_names <- gsub("BodyBody", "Body", features_meanstd_names)

# Removes any special characters

features_meanstd_names <- gsub("[\\(\\)-]", "", features_meanstd_names)

# Loads in the traning data

train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_meanstd_pos]
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train)

# Loads in the test data

test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_meanstd_pos]
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test)

# Merges data together and add column labels

total_data <- rbind(train, test)
colnames(total_data) <- c("subject", "activity", features_meanstd_names)

# Convert activities and subjects into factors

total_data$activity <- factor(total_data$activity, levels = activity_labels[,1], labels = activity_labels[,2])
total_data$subject <- as.factor(total_data$subject)

# Removes original data frames to save memory

rm(activity_labels, features, test, test_activities, test_subjects, train, train_activities, train_subjects)

# Creates a second, independent tidy set grouped by subject and activity and summarized using the mean

total_data_means <- total_data %>% 
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

# Writes tidy data to output file "tidy_data.txt"
write.table(total_data_means, "tidy_data.txt", row.names = FALSE, quote = FALSE)
