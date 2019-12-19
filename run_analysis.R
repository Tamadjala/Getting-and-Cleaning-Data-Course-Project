
# Reading feature file
feature <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/features.txt", col.names = c("n", "attribut"))

# Reading activity file
activity <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))

# Reading testing files
subject_test <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/test/X_test.txt", col.names = feature$attribut)
y_test <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/test/y_test.txt", col.names = "id")

# Reading training files
subject_train <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/train/X_train.txt", col.names = feature$attribut)
y_train <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/train/y_train.txt", col.names = "id")

# 1. Merge the training and test sets to create one data set
x_merg <- rbind(x_train, x_test)
y_merg <- rbind(y_train, y_test)
subject_merg <- rbind(subject_train, subject_test)

# Gathering them into one data
final_data <- cbind(subject_merg, y_merg, x_merg)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

final_data <- select(final_data, subject, id, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set

final_data$id <- activity[final_data$id, 2]

# 4. Appropriately labels the data set with descriptive names(final_data)s names. 



names(final_data)[2] <- "activity"
names(final_data) <- gsub("^t", "Time", names(final_data))
names(final_data) <- gsub("Acc", "Accelerometer", names(final_data))
names(final_data) <- gsub("Gravi", "Gravity", names(final_data))
names(final_data) <- gsub("Gyro", "Gyroscope", names(final_data))
names(final_data) <- gsub("Mag", "Magnitude", names(final_data))
names(final_data) <- gsub("^f", "Frequency", names(final_data))
names(final_data) <- gsub("BodyBody", "Body", names(final_data))
names(final_data) <- gsub("angle", "Angle", names(final_data))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# group by subject and activity and summarise using mean

                  
 finaldata<-aggregate(. ~subject + activity, final_data, mean)
 finaldata<-finaldata[order(finaldata$subject,finaldata$activity),]
                  
write.table(finaldata, file = "finaldata.txt", row.names = FALSE)
            



