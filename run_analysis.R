
# Reading feature file

feature <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/features.txt", col.names = c("n", "attribut"))

# Reading activity file

activity <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))

# Reading testing files
subject_test <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/test/subject_test.txt", col.names = "subjet")
x_test <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/test/X_test.txt", col.names = feature$attribut)
y_test <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/test/y_test.txt", col.names = "id")

# Reading training files
subject_train <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/train/X_train.txt", col.names = feature$attribut)
y_train <- read.table("/Users/tamadjala/Desktop/R_Coursera/UCI HAR Dataset/train/y_train.txt", col.names = "id")