# Getting and Cleaning Data - peer assessment project

The data was transformed by these 5 steps:

# 1-Merging the training and the test sets to create one data set.
    -Dataset downloaded and extracted under the folder called UCI HAR Dataset and store in differents files 
    
    - Using rbind() function to merge the x_ variables, y_ variable and subject_variable
    - Then used the cbind() function to create one data set 

# 2-Extracting only the measurements on the mean and standard deviation for each measurement.
    - With the select() function, used the contains() function for each argument "mean" and           "sdt" 
    
#3-Using descriptive activity names to name the activities in the data set
    - Entire numbers in id column of the data replaced with corresponding activity taken from         second column of the activities variable
    

# 4-Appropriately labeling the data set with descriptive activity names.
    By using gsub function:
        -All Acc in column’s name replaced by Accelerometer
        -All Gyro in column’s name replaced by Gyroscope
        -All BodyBody in column’s name replaced by Body
        -All Mag in column’s name replaced by Magnitude
        -All start with character f in column’s name replaced by Frequency
        -All start with character t in column’s name replaced by Time
        -id column in Final_data renamed into activities

# 5-Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

    -The final_data was grouped by "subject" and "activity" then created an independent tidy set with the mean 
    - the fdata exported into finaldata.txt