# Read the activity labels for readability

activity_labels <- read.table("activity_labels.txt",header=F,sep=" ")
# add colnames to the dataframe for doing the merge
colnames(activity_labels) <- c("id","activities")

# Read y_test, whch provides the activity codes for the test with 2947 observation
y_test <- read.table("y_test.txt",header=F,sep=" ")
y_test <- cbind(1:nrow(y_test),y_test)
colnames(y_test) <- c("id","act_code")
# merge performin left join 
y_test <- merge(x = y_test, y = activity_labels, by.x="act_code", by.y = "id", all.x = TRUE)
# merge doesn't keep the order, so it is necessary to sort the dataframe again
y_test <- y_test[order(y_test[,2]),]
subject_test <- read.table("subject_test.txt",header=F,sep=" ",col.names = c("subject"))
# bind the observations with the subject
y_test <- cbind(y_test, subject_test)

# Read the data with fixed width fields, -XXX means jump XXX characters/positions
test_data <- read.fwf("X_test.txt",widths = c(16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,-176,16,16,-176,16,16,-176,16,16,-176,16,16,-176,16,16,16,16,16,16,-1168,16,16,16,16,16,16,-1168,16,16,16,16,16,16,-1168,16,16,-176,16,16,-176,16,16,-176,16,16))
# Reorder the columns to bring together the mean an std for the vector variables  
test_data <- test_data[,c(1,4,2,5,3,6,7,10,8,11,9,12,13,16,14,17,15,18,19,22,20,23,21,24,25,28,26,29,27,30,31:40,41,44,42,45,43,46,47,50,48,51,49,52,53,56,54,57,55,58,59:66)]
y_test <-  cbind(rep("test",nrow(y_test)),y_test[,c(4,3)],test_data)
# Provide proper names to the columns
colnames(y_test) <- c("train/test","subject","activity","tBodyAcc-X mean","tBodyAcc-X std","tBodyAcc-Y mean","tBodyAcc-Y std","tBodyAcc-Z mean","tBodyAcc-Z std","tGravityAcc-X mean","tGravityAcc-X std","tGravityAcc-Y mean","tGravityAcc-Y std","tGravityAcc-Z mean","tGravityAcc-Z std","tBodyAccJerk-X mean","tBodyAccJerk-X std","tBodyAccJerk-Y mean","tBodyAccJerk-Y std","tBodyAccJerk-Z mean","tBodyAccJerk-Z std","tBodyGyro-X mean","tBodyGyro-X std","tBodyGyro-Y mean","tBodyGyro-Y std","tBodyGyro-Z mean","tBodyGyro-Z std","tBodyGyroJerk-X mean","tBodyGyroJerk-X std","tBodyGyroJerk-Y mean","tBodyGyroJerk-Y std","tBodyGyroJerk-Z mean","tBodyGyroJerk-Z std","tBodyAccMag mean","tBodyAccMag std","tGravityAccMag mean","tGravityAccMag std","tBodyAccJerkMag mean","tBodyAccJerkMag std","tBodyGyroMag mean","tBodyGyroMag std","tBodyGyroJerkMag mean","tBodyGyroJerkMag std","fBodyAcc-X mean","fBodyAcc-X std","fBodyAcc-Y mean","fBodyAcc-Y std","fBodyAcc-Z mean","fBodyAcc-Z std","fBodyAccJerk-X mean","fBodyAccJerk-X std","fBodyAccJerk-Y mean","fBodyAccJerk-Y std","fBodyAccJerk-Z mean","fBodyAccJerk-Z std","fBodyGyro-X mean","fBodyGyro-X std","fBodyGyro-Y mean","fBodyGyro-Y std","fBodyGyro-Z mean","fBodyGyro-Z std","fBodyAccMag mean","fBodyAccMag std","fBodyAccJerkMag mean","fBodyAccJerkMag std","fBodyGyroMag mean","fBodyGyroMag std","fBodyGyroJerkMag mean","fBodyGyroJerkMag std")

# Do the sma eoperation for the train files
y_train <- read.table("y_train.txt",header=F,sep=" ")
y_train <- cbind(1:nrow(y_train),y_train)
colnames(y_train) <- c("id","act_code")
y_train <- merge(x = y_train, y = activity_labels, by.x="act_code", by.y = "id", all.x = TRUE)
y_train <- y_train[order(y_train[,2]),]
subject_train <- read.table("subject_train.txt",header=F,sep=" ",col.names = c("subject"))
y_train <- cbind(y_train, subject_train)

# And again read the fixed width fields correspondign to the train data, with 7352 observations

train_data <- read.fwf("X_train.txt",widths = c(16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,16,16,16,16,-544,16,16,-176,16,16,-176,16,16,-176,16,16,-176,16,16,-176,16,16,16,16,16,16,-1168,16,16,16,16,16,16,-1168,16,16,16,16,16,16,-1168,16,16,-176,16,16,-176,16,16,-176,16,16))
train_data <- train_data[,c(1,4,2,5,3,6,7,10,8,11,9,12,13,16,14,17,15,18,19,22,20,23,21,24,25,28,26,29,27,30,31:40,41,44,42,45,43,46,47,50,48,51,49,52,53,56,54,57,55,58,59:66)]
y_train <- cbind(rep("train",nrow(y_train)),y_train[,c(4,3)],train_data)
colnames(y_train) <- c("train/test","subject","activity","tBodyAcc-X mean","tBodyAcc-X std","tBodyAcc-Y mean","tBodyAcc-Y std","tBodyAcc-Z mean","tBodyAcc-Z std","tGravityAcc-X mean","tGravityAcc-X std","tGravityAcc-Y mean","tGravityAcc-Y std","tGravityAcc-Z mean","tGravityAcc-Z std","tBodyAccJerk-X mean","tBodyAccJerk-X std","tBodyAccJerk-Y mean","tBodyAccJerk-Y std","tBodyAccJerk-Z mean","tBodyAccJerk-Z std","tBodyGyro-X mean","tBodyGyro-X std","tBodyGyro-Y mean","tBodyGyro-Y std","tBodyGyro-Z mean","tBodyGyro-Z std","tBodyGyroJerk-X mean","tBodyGyroJerk-X std","tBodyGyroJerk-Y mean","tBodyGyroJerk-Y std","tBodyGyroJerk-Z mean","tBodyGyroJerk-Z std","tBodyAccMag mean","tBodyAccMag std","tGravityAccMag mean","tGravityAccMag std","tBodyAccJerkMag mean","tBodyAccJerkMag std","tBodyGyroMag mean","tBodyGyroMag std","tBodyGyroJerkMag mean","tBodyGyroJerkMag std","fBodyAcc-X mean","fBodyAcc-X std","fBodyAcc-Y mean","fBodyAcc-Y std","fBodyAcc-Z mean","fBodyAcc-Z std","fBodyAccJerk-X mean","fBodyAccJerk-X std","fBodyAccJerk-Y mean","fBodyAccJerk-Y std","fBodyAccJerk-Z mean","fBodyAccJerk-Z std","fBodyGyro-X mean","fBodyGyro-X std","fBodyGyro-Y mean","fBodyGyro-Y std","fBodyGyro-Z mean","fBodyGyro-Z std","fBodyAccMag mean","fBodyAccMag std","fBodyAccJerkMag mean","fBodyAccJerkMag std","fBodyGyroMag mean","fBodyGyroMag std","fBodyGyroJerkMag mean","fBodyGyroJerkMag std")

# Merge both together by means of a rowbind and reorder by subject

y_train_plus_test <- rbind(y_train,y_test)
y_train_plus_test <- y_train_plus_test [order(y_train_plus_test[,2]),]

# Anañysis part

# Loop 1 take any subject and produce a subset of the whole observation dataframe y_train_plus_test
l <- 0
for (i in unique(y_train_plus_test$subject)) {
# Move the subset to aux_matrix
  aux_matrix <- y_train_plus_test[y_train_plus_test$subject == i,]
# Loop 2, then apply to each column (variable) the mean function, splitting/grouping by activity
  for (k in 4:ncol(aux_matrix))  {
# the result for each step in the Loop 2 is a vector with the mean per activity correspondign to the variable
# Loop 2 is an innner loop to loop 1 and therefore the mean is per activity ad per subject (Loop 1)
    aux_dat <- tapply(aux_matrix[,k],aux_matrix$activity, mean)
    if (k == 4) {
      aux_dat <- cbind(rownames(aux_dat),aux_dat)
      aux_dat2 <- aux_dat
    }
    else
      aux_dat2 <- cbind(aux_dat2,aux_dat)
# In Loop 2, we combine columns corresponding to the variables (66)
  }   
# End of Loop 2
# In Loop 1, we add, subject after subject by means of rowbind the results for the different subjects (6 lines that corresponds to 6 type of activities)  
  aux_dat3 <- cbind(rep(i,nrow(aux_dat2)),aux_dat2)
  if (l == 0 ) 
    aux_dat4 <- aux_dat3
  else 
    aux_dat4 <- rbind(aux_dat4,aux_dat3)
  l <- l+1
}
# End of Loop 1
aux_dat4 <- data.frame(aux_dat4)

# Finally we can rename the columns and write in fixed width format to a flat file. We need to justify the column names for readability
colnames(aux_dat4) <- c("subject","              activity","       tBodyAcc-X mean","        tBodyAcc-X std","       tBodyAcc-Y mean","        tBodyAcc-Y std","       tBodyAcc-Z mean","        tBodyAcc-Z std","    tGravityAcc-X mean","     tGravityAcc-X std","    tGravityAcc-Y mean","     tGravityAcc-Y std","    tGravityAcc-Z mean","     tGravityAcc-Z std","   tBodyAccJerk-X mean","    tBodyAccJerk-X std","   tBodyAccJerk-Y mean","    tBodyAccJerk-Y std","   tBodyAccJerk-Z mean","    tBodyAccJerk-Z std","      tBodyGyro-X mean","       tBodyGyro-X std","      tBodyGyro-Y mean","       tBodyGyro-Y std","      tBodyGyro-Z mean","       tBodyGyro-Z std","  tBodyGyroJerk-X mean","   tBodyGyroJerk-X std","  tBodyGyroJerk-Y mean","   tBodyGyroJerk-Y std","  tBodyGyroJerk-Z mean","   tBodyGyroJerk-Z std","      tBodyAccMag mean","       tBodyAccMag std","   tGravityAccMag mean","    tGravityAccMag std","  tBodyAccJerkMag mean","   tBodyAccJerkMag std","     tBodyGyroMag mean","      tBodyGyroMag std"," tBodyGyroJerkMag mean","  tBodyGyroJerkMag std","       fBodyAcc-X mean","        fBodyAcc-X std","       fBodyAcc-Y mean","        fBodyAcc-Y std","       fBodyAcc-Z mean","        fBodyAcc-Z std","   fBodyAccJerk-X mean","    fBodyAccJerk-X std","   fBodyAccJerk-Y mean","    fBodyAccJerk-Y std","   fBodyAccJerk-Z mean","    fBodyAccJerk-Z std","      fBodyGyro-X mean","       fBodyGyro-X std","      fBodyGyro-Y mean","       fBodyGyro-Y std","      fBodyGyro-Z mean","       fBodyGyro-Z std","      fBodyAccMag mean","       fBodyAccMag std","  fBodyAccJerkMag mean","   fBodyAccJerkMag std","     fBodyGyroMag mean","      fBodyGyroMag std"," fBodyGyroJerkMag mean","  fBodyGyroJerkMag std")
# For write.fwf we need to use the library (gdata)
write.fwf(aux_dat4,"summary_y_train_plus_test.txt",width=c(7,rep(22,67)),justify="right")
