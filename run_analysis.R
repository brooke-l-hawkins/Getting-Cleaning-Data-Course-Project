
# SETUP

# Directories
work.dir <- "/Users/brookehawkins/Documents/Summer Learning/GettingCleaningData/Getting & Cleaning Data Course Project/"
data.dir <- "/Users/brookehawkins/Documents/Summer Learning/GettingCleaningData/UCI HAR Dataset/"
test.dir <- paste0(data.dir, "test/")
train.dir <- paste0(data.dir, "train/")

# Libraries
library(dplyr)


# STEP 1: Merges the training and the test sets to create one data set.
X.test  <- read.table(file = paste0(test.dir,  "X_test.txt"))
X.train <- read.table(file = paste0(train.dir, "X_train.txt"))
X <- rbind(X.test, X.train)
rm(X.test, X.train)


# STEP 2: Extracts only the measurements on the mean and standard deviation for 
# each measurement.

# find feature names
features.name <- paste0(data.dir, "features.txt")
features.table <- read.table(file = features.name)
features <- features.table[ , 2]
features <- as.character(features)
rm(features.name, features.table)

# find mean and standard deviation features
mean.output <- grepl("mean()", features, fixed = T)
mean.columns <- which(mean.output == T)
std.output <- grepl("std()", features, fixed = T)
std.columns <- which(std.output == T)
keep <- sort(c(mean.columns, std.columns))
rm(mean.output, mean.columns, std.output, std.columns)

# keep mean and standard deviation features
X <- X[ , keep]
names(X) <- features[keep]
rm(features, keep)


# STEP 3: Uses descriptive activity names to name the activities in the data set.

# find activity numbers and labels
activity.labels <- read.table(file = paste0(data.dir, "activity_labels.txt"))
activity.characters <- as.character(activity.labels[ , 2])
rm(activity.labels)

# find and combine test and train activity numbers in activity.table
test.activity.table <- read.table(file = paste0(test.dir, "y_test.txt"))
train.activity.table <- read.table(file = paste0(train.dir, "y_train.txt"))
activity.table <- rbind(test.activity.table, train.activity.table)
rm(test.activity.table, train.activity.table)

# change data in activity.table from numeric to factor with activity labels
activity.numbers <- activity.table[ , 1]
activity.factors <- as.factor(activity.numbers)
levels(activity.factors) <- activity.characters
activity.table[ , 1] <- activity.factors
colnames(activity.table) <- "Activity"
rm(activity.characters, activity.numbers, activity.factors)

# add activity column to data
X <- cbind(activity.table, X)
rm(activity.table)


# STEP 4: Appropriately labels the data set with descriptive variable names.
new.names <- names(X)
new.names <- gsub("mean", "Mean", new.names, fixed = T)
new.names <- gsub("std",  "Std", new.names, fixed = T)
new.names <- gsub("-", "", new.names, fixed = T)
new.names <- gsub("()", "", new.names, fixed = T)
new.names <- gsub("BodyBody", "Body", new.names, fixed = T)
names(X) <- new.names
rm(new.names)


# STEP 5: From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

# find and combine test and train activity numbers in subject.table
test.subject.table <- read.table(file = paste0(test.dir, "subject_test.txt"))
train.subject.table <- read.table(file = paste0(train.dir, "subject_train.txt"))
subject.table <- rbind(test.subject.table, train.subject.table)
colnames(subject.table) <- "Subject"
rm(test.subject.table, train.subject.table)

# add activity column to data
X <- cbind(subject.table, X)
rm(subject.table)

# average each variable by activity and subject
tidy.dataset <- X %>%
    group_by(Subject, Activity) %>% 
    summarise_at(3:68, mean)

# save tidy dataset as txt file
write.table(tidy.dataset, row.names = F, col.names = F, 
            file = paste0(work.dir, "tidy.txt"))

