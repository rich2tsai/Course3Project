# This script does the following on the UCI HAR dataset:
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# get measurement descriptors
var_map <- read.table("./UCI HAR Dataset/features.txt", header=FALSE, col.names=c("id","description"))

# get training set data and put subject/volunteer id and activity id together with measurements
df_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
names(df_train_data) <- var_map$description
df_train_subj <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
names(df_train_subj) <- "subject.id"
df_train_act <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
names(df_train_act) <- "activity"
df_train <- cbind(df_train_subj, df_train_act, df_train_data)

# get test set data and put subject/volunteer id and activity id together with measurements
df_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
names(df_test_data) <- var_map$description
df_test_subj <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
names(df_test_subj) <- "subject.id"
df_test_act <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
names(df_test_act) <- "activity"
df_test <- cbind(df_test_subj, df_test_act, df_test_data)

# merge training and test sets
df <- rbind(df_train, df_test)

# get index of those measurements that are mean or standard deviation
var_idx <- grep("(-mean|-std)", var_names$description)
col_idx <- c(1,2,var_idx+2)     #to keep the first two columns
df <- df[,col_idx]

# use descriptive activity names
act_map <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, col.names=c("id","description"))
act_names <- factor(df$activity, labels=act_map$description)
df$activity <- act_names

#create summary table and write out to file
library(reshape2)
summary <- dcast(molten, subject.id + activity ~ variable, mean)
#write.table(summary, row.names=FALSE, file = './summary.txt')
