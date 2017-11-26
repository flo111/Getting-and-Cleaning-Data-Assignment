library(plyr)
library(dplyr)
# Read the data (Working directory is the main folder)
features<-read.table("features.txt")
actLabels<-read.table("activity_labels.txt")
subjectTest<-read.table("./test/subject_test.txt")
xTest<-read.table("./test/X_test.txt")
yTest<-read.table("./test/y_test.txt")
subjectTrain<-read.table("./train/subject_train.txt")
xTrain<-read.table("./train/X_train.txt")
yTrain<-read.table("./train/y_train.txt")

# Create a Dataset for the training data
dataTrain <- xTrain
names(dataTrain) <- features[,2]
names(subjectTrain) <- "subjects"
names(yTrain) <- "labels"
dataTrain <- cbind(subjectTrain,yTrain,dataTrain)

# Create a Dataset for the test data
dataTest <- xTest
names(dataTest) <- features[,2]
names(subjectTest) <- "subjects"
names(yTest) <- "labels"
dataTest <- cbind(subjectTest,yTest,dataTest)

# Merge training and test data to create one data set
dataComplete <- rbind(dataTrain, dataTest)
dataComplete <- dataComplete[order(dataComplete$subjects, dataComplete$labels),]

#Extract only the mean and std for each measurement
dataMeanStd <- cbind(dataComplete[,1:2],dataComplete[,grepl(".*mean.*|.*std.*", names(dataComplete))])

# Replace activity labels with decriptive activity names
dataMeanStd$labels <- mapvalues(dataMeanStd$labels, c("1","2","3","4","5","6"), c("walking", "walkingUpstairs", "walkingDownstairs", "sitting", "standing", "laying"))

# Replace variable names with descriptive names
names(dataMeanStd) <- ifelse(is.element(substr(names(dataMeanStd), 1, 1), c("t", "f")), paste(mapvalues(substr(names(dataMeanStd), 1, 1), c("t", "f"),
                    c("time", "freq")), substring(names(dataMeanStd), 2), sep=""), names(dataMeanStd))
names(dataMeanStd)<-gsub("\\(|\\)","",names(dataMeanStd))
names(dataMeanStd)<-gsub("-",".",names(dataMeanStd))

# Group the data by subjects and activity labels and calculate the means for all variables
tidyData <- dataMeanStd %>% group_by(subjects,labels) %>% summarise_all(funs(mean))