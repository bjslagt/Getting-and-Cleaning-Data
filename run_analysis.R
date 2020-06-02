library(data.table)
library(reshape2)

# We can assume (according to the task) that the data will be below the current directory
path <-getwd()
# I've assuming the dataset will still be in the UCI HAR Dataset directory


# Load: the activity labels file and store it in activity_labels
activity_labels <- read.table(file.path(path,"UCI HAR Dataset/activity_labels.txt"))[,2]

# Load: the features file and store it in features
features <- read.table(file.path(path,"UCI HAR Dataset/features.txt"))[,2]

# we only need mean and standard deviation (std)
extractedfeatures <- grepl("mean|std", features)

# Load: the x_ , y_ and subject_ test data files into x_test, y_test and subject_tst
x_test <- read.table(file.path(path,"UCI HAR Dataset/test/X_test.txt"))
#set the column names of x_test
names(x_test) = features

y_test <- read.table(file.path(path,"UCI HAR Dataset/test/y_test.txt"))
subject_test <- read.table(file.path(path,"UCI HAR Dataset/test/subject_test.txt"))


#only needed measurements
x_test_needed <- x_test[,extractedfeatures]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("ActivityID", "Activity_Label")
names(subject_test) = "SubjectID"

# Bind data
test <- cbind(subject_test, y_test, x_test_needed)

# Same process with train data
x_train <- read.table(file.path(path,"UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(file.path(path,"UCI HAR Dataset/train/y_train.txt"))
subject_train <- read.table(file.path(path,"UCI HAR Dataset/train/subject_train.txt"))
names(x_train) = features
x_train_needed = x_train[,extractedfeatures]
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("ActivityID", "Activity_Label")
names(subject_train) = "SubjectID"

# Bind data
train <- cbind(subject_train, y_train, x_train_needed)

# Merge test and train data
merged_data = rbind(test, train)


melt_id   = c("SubjectID", "ActivityID", "Activity_Label")
melt_vars = setdiff(colnames(merged_data), melt_id)
melt_data      = reshape2::melt(merged_data, id = melt_id, measure.vars = melt_vars)

# Use dcast function
tidy_data   = reshape2::dcast(melt_data, SubjectID + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt" ,row.names = FALSE)
