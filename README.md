### Description

The script is used to calculate the average of each variable in the given data set for each subject and activity.

### Details

#### Variable Description

* features : Reads the features.txt
* activity : Reads the activity.txt
* xTest : Reads X_test.txt which contains testing set
* yTest : Reads Y_test.txt which contains testing activity id
* yTest[2] : Combines the activity id with the activity name
* colnames(yTest) : Update column name
* subjectTest : Reads subject_test.txt which contains subject id
* bodyAccXTest : Reads body_acc_x_test.txt which contains testing set data for body acceleration x axis; standard gravity units in g
* bodyAccYTest : Reads body_acc_y_test.txt which contains testing set data for body acceleration y axis; standard gravity units in g
* bodyAccZTest : Reads body_acc_z_test.txt which contains testing set data for body acceleration z axis; standard gravity units in g
* bodyGyroXTest : Reads body_gyro_x_test.txt which contains testing set data for angular velocity x axis; units in radians/second  
* bodyGyroYTest : Reads body_gyro_y_test.txt which contains testing set data for angular velocity y axis; units in radians/second
* bodyGyroZTest: Reads body_gyro_z_test.txt which contains testing set data for angular velocity z axis; units in radians/second
* totalAccXTest : Reads total_acc_x_test.txt which contains testing set data for total acceleration x axis; standard gravity units in g
* totalAccYTest : Reads total_acc_y_test.txt which contains testing set data for total acceleration y axis; standard gravity units in g
* totalAccZTest : Reads total_acc_z_test.txt which contains testing set data for total acceleration z axis; standard gravity units in g
* testData : Contains complete test data with subject, activities and all measurements

* xTrain : Reads X_train.txt which contains training set
* yTrain : Reads Y_train.txt which contains training activity id
* yTrain[2] : Combines the activity id with the activity name
* colnames(yTrain) : Update column name
* subjectTrain : Reads subject_train.txt which contains subject id
* bodyAccXTrain : Reads body_acc_x_train.txt which contains training set data for body acceleration x axis; standard gravity units in g
* bodyAccYTrain : Reads body_acc_y_train.txt which contains training set data for body acceleration y axis; standard gravity units in g
* bodyAccZTrain : Reads body_acc_z_train.txt which contains training set data for body acceleration z axis; standard gravity units in g
* bodyGyroXTrain : Reads body_gyro_x_train.txt which contains training set data for angular velocity x axis; units in radians/second  
* bodyGyroYTrain : Reads body_gyro_y_train.txt which contains training set data for angular velocity y axis; units in radians/second  
* bodyGyroZTrain : Reads body_gyro_z_train.txt which contains training set data for angular velocity z axis; units in radians/second  
* totalAccXTrain : Reads total_acc_x_train.txt which contains training set data for total acceleration x axis; standard gravity units in g
* totalAccYTrain : Reads total_acc_y_train.txt which contains training set data for total acceleration y axis; standard gravity units in g
* totalAccZTrain : Reads total_acc_z_train.txt which contains training set data for total acceleration z axis; standard gravity units in g
* trainData : Contains complete training data with subject, activities and all measurements

* finalData : Combine training and test data to create a final data set
* measurementMean : Mean data for each activity
* measurementSd : Standard deviation data for each activity
* meltFinalData : Melt the final data for further processing
* castFinalData : Use cast to create the average data per subject and activity

