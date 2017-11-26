Readme file for the run_analysis.R script to create the dataset "tidyData" - Getting and Cleaning Data Assignment

# Read the data (Working directory is the main folder)
- reads the relevant data files into R using the read.table() function and stores them in descriptively named R objects
- xTrain and xTest contain the measured data
- yTrain and yTest contain the activitiy indices 
- subjectTrain and subjectTest contain the subject IDs
- features contains the variable labels for the xTrain and xTest data sets
- actLabels contains the association between activity labels and indices

# Create a Dataset for the training data
- the training data is stored in a new variable named dataTrain and variable/column names are assigned from the features object
- the variable name "subjects" is assigned to the subjectTrain object
- the variable name "labels" is assigned to the yTrain object containing the activity indices
- the information about subjects and activity labels are added to the left side of the dataTrain data set using the cbind() function

# Create a Dataset for the test data
- the testdata is stored in a new variable named dataTest and variable/column names are assigned from the features object
- the variable name "subjects" is assigned to the subjectTest object
- the variable name "labels" is assigned to the xTest object containing the activity indices
- the information about subjects and activity labels are added to the left side of the dataTest data set using the cbind() function

# Merge training and test data to create one data set
- the dataTrain and dataTest data sets are merged together using the rbind() function
- the resulting data set dataComplete contains the data for all 30 subjects and all variables
- the dataCOmplete data set is reordered for clarity purposes using the order() function

#Extract only the mean and std for each measurement
- a new data set named dataMeanStd is created which only contains the measurements on the mean and standard deviation for each measurement
- the corresponding variables are selected, if they either contain the strings "mean" or "std" at any point within the variable name
- the first two columns containing the subject IDs and activity indices are bound together with the resulting columns using the cbind() function 

# Replace activity labels with decriptive activity names
- the activity indices in the "labels" variable are replaced with the activity labels using the mapvalues() function from the plyr package
- in the mapvalues() function, substitution is performed by order of the vectors
- the association of indices and labels is read from the actLabels object: 1=walking, 2=walkingUpstairs, 3=walkingDownstairs, 4=sitting, 5=standing, 6=laying

# Replace variable names with descriptive names
- to make the variable names more descriptive, the leading "t" and "f" in the names are replaced with "time" and "freq" respectively
- the replacement is carried out using the ifelse function that decides which replacement to perform depending on the leading letter; if no condition is met 
	(as for the variable names in the first two columns, no replacement is performed)
- furthermore, special characters should be avoided in variable names, so that brackets() and hyphens- are replaced with nothing "" and a dot "." respectively
- the replacement here is carried out using the gsub() function

# Group the data by subjects and activity labels and calculate the means for all variables
- finally, the data set "tidyData" is created which contains the means for each variable across all instances of the same activity label
- to achieve this, the dplyr package is used to group the data by subjects and activity labels, then the summarise_all() function is used to calculate
	the mean across these groups