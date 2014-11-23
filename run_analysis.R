features<- read.table("UCI HAR Dataset/features.txt", header=FALSE, sep=" ", strip.white=TRUE, stringsAsFactors=FALSE, col.names=c("feature_id", "feature_name"))

activity <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, strip.white=TRUE, col.names=c("activity_id", "activity_name"), stringsAsFactors=FALSE)

xTest <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE, strip.white=TRUE, col.names=features[,2])

yTest <- read.table("UCI HAR Dataset/test/Y_test.txt", header=FALSE, strip.white=TRUE, col.names=c("activity_id"))

yTest[2] = activity[yTest[,1],2]

colnames(yTest) <- c("activity_id", "activity_name")

subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE, strip.white=TRUE, col.names=c("subject_id"))

bodyAccXTest <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("bodyAccelerationX",1:128,sep=""))

bodyAccYTest <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("bodyAccelerationY",1:128,sep=""))

bodyAccZTest <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("bodyAccelerationZ",1:128,sep=""))

bodyGyroXTest <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("angularVelocityX",1:128,sep=""))

bodyGyroYTest <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("angularVelocityY",1:128,sep=""))

bodyGyroZTest <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("angularVelocityZ",1:128,sep=""))

totalAccXTest <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("totalAccelerationX",1:128,sep=""))

totalAccYTest <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("totalAccelerationY",1:128,sep=""))

totalAccZTest <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header=FALSE, strip.white=TRUE, col.names=paste("totalAccelerationZ",1:128,sep=""))

testData <- data.frame(subjectTest, yTest, xTest, bodyAccXTest, bodyAccYTest, bodyAccZTest, bodyGyroXTest, bodyGyroYTest, bodyGyroZTest, totalAccXTest, totalAccYTest, totalAccZTest)

xTrain <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, strip.white=TRUE, col.names=features[,2])

yTrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header=FALSE, strip.white=TRUE, col.names=c("activity_id"))

yTrain[2] = activity[yTrain[,1],2]

colnames(yTrain) <- c("activity_id", "activity_name")

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE, strip.white=TRUE, col.names=c("subject_id"))

bodyAccXTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("bodyAccelerationX",1:128,sep=""))

bodyAccYTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("bodyAccelerationY",1:128,sep=""))

bodyAccZTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("bodyAccelerationZ",1:128,sep=""))

bodyGyroXTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("angularVelocityX",1:128,sep=""))

bodyGyroYTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("angularVelocityY",1:128,sep=""))

bodyGyroZTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("angularVelocityZ",1:128,sep=""))

totalAccXTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("totalAccelerationX",1:128,sep=""))

totalAccYTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("totalAccelerationY",1:128,sep=""))

totalAccZTrain <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header=FALSE, strip.white=TRUE, col.names=paste("totalAccelerationZ",1:128,sep=""))

trainData <- data.frame(subjectTrain, yTrain, xTrain, bodyAccXTrain, bodyAccYTrain, bodyAccZTrain, bodyGyroXTrain, bodyGyroYTrain, bodyGyroZTrain, totalAccXTrain, totalAccYTrain, totalAccZTrain)

finalData <- rbind(trainData, testData)

measurementMean = sapply(finalData[-c(1:3)], mean, na.rm=TRUE)
measurementSd = sapply(finalData[-c(1:3)], sd, na.rm=TRUE)

meltFinalData <- melt(finalData, id=c("subject_id", "activity_id", "activity_name"), na.rm=TRUE)
castFinalData <- acast(meltFinalData, subject_id ~ activity_name ~ variable, mean, na.rm=TRUE)
write.table(castFinalData, file="AverageData.txt", row.name=FALSE)