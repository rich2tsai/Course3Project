##Raw Data Pack
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Processing Performed
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Data and Variables
The result is a data frame containing the averages of each variable for each activity and each subject/volunteer.

It contains the following columns:
- 'subject.id' : The id of the subject / volunteer
- 'activity' : The description of the activity taken by the volunteer
- variables such as 'tBodyAcc-mean()-X' : The naming convention and description is contained in features_info.txt (copied from the raw data pack).
