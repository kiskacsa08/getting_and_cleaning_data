library(reshape2)

# Read activities and features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the mean and standard deviation features
effective_features <- grep(".*mean.*|.*std.*", features)

# Read test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Read train set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Set the column names of x_test and x_train for the extraction
names(x_test) = features
names(x_train) = features

# Extract only the mean and standard deviation data
x_test <- x_test[,effective_features]
x_train <- x_train[,effective_features]

# Change the IDs in the y_ data to activity names
y_test[,1] <- activity_labels[y_test[,1]]
y_train[,1] <- activity_labels[y_train[,1]]

# Set the column name of the activities column and the subject column
names(y_train) <- c("Activity")
names(y_test) <- c("Activity")
names(subject_train) <- c("Subject")
names(subject_test) <- c("Subject")

# Merge the test data
merged_test <- cbind(subject_test, y_test, x_test)

# Merge the train data
merged_train <- cbind(subject_train, y_train, x_train)

# Merge the test and train data (this will be the tidy data)
merged_data <- rbind(merged_train, merged_test)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject
melted_data <- dcast(melt(merged_data, id = c("Subject", "Activity"), measure.vars = names(merged_data[,3:length(names(merged_data))])), Subject + Activity ~ variable, mean)

# Write out the data
write.table(merged_data, "tidy_data.txt", row.names = FALSE)
write.table(melted_data, "avg_tidy_data.txt", row.names = FALSE)