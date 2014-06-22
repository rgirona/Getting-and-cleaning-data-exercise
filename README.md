Getting-and-cleaning-data-exercise
==================================

Getting and cleaning data exercise


For each record it is provided the average of the variables:
===========================================================

tBodyAcc-XYZ - Estimated triaxial acceleration for the  body acceleration.
tGravityAcc-XYZ - Triaxial gravity acceleration
tBodyAccJerk-XYZ - Change of the acceleration for the body
tBodyGyro-XYZ - Triaxial Angular velocity from the gyroscope. 
tBodyGyroJerk-XYZ - Triaxial change of Angular velocity from the gyroscope. 
tBodyAccMag - Scalar magnitude of acceleration for the body
tGravityAccMag -
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


The dataset includes the following files:
=========================================

- 'README.txt', this file

- 'y_train_plus_test.txt': Shows averages for the variables of the exercise per subject and type of activity 
- 'run_analysis.R" Performs the operations to:

  1. Merge the training and the test sets to create one data set.
  2. Extract only the measurements on the mean and standard deviation for each measurement.
  3. Use descriptive activity names (from activity labels) to name the activities in the data set
  4. Appropriately label the data set with descriptive variable names.
  5. Create a second, independent tidy data set with the average of each variable for each activity and
  each subject., the former file "y_train_plus_test.txt"



Prerequisites:
==============

- Library gdata: write.fwf to write with a fixed width field format
