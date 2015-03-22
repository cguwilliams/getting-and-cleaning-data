# library(data.table)
library(plyr)      #plyr for mapvalues function, reshape2 for melt and dcast functions
library(reshape2)
###### IMPORTANT: set working directory to BASE directory of data txt files
#read in data for training and testing data, as well as activity and feature labels
fs <- .Platform$file.sep                                                             #get system specific filesep (different on windows vs Unix based systems)
trainmeasures <- read.table(paste(getwd(),fs,'train',fs,'X_train.txt',sep=''))       #read data for training set measurements
trainacts     <- read.table(paste(getwd(),fs,'train',fs,'y_train.txt',sep=''))       #read data for training set activities
trainlabel    <- read.table(paste(getwd(),fs,'train',fs,'subject_train.txt',sep='')) #read data for training set subject numbers
testmeasures  <- read.table(paste(getwd(),fs,'test',fs,'X_test.txt',sep=''))         #read data for test set measurements
testacts      <- read.table(paste(getwd(),fs,'test',fs,'y_test.txt',sep=''))         #read data for test set activities
testlabel     <- read.table(paste(getwd(),fs,'test',fs,'subject_test.txt',sep=''))   #read data for test set subject numbers

activitylabel <- read.table(paste(getwd(),'/activity_labels.txt',sep=''))            #read activity labels from txt file
featurelabels <- read.table(paste(getwd(),'/features.txt',sep=''))                   #read feature names from txt file
featurelabels <- featurelabels[-c(1)]                                                #remove index column so only labels remain
trainset      <- rep('train', dim(trainmeasures)[1])
testset       <- rep('test', dim(testmeasures)[1])

#1. Merge training and test sets to create one data set
subjects   <- rbind(trainlabel[1],testlabel[1])                     #Create one column of data for all subjects
activities <- rbind(trainacts[1],testacts[1])                       #Create one column of data for all activities
measures   <- rbind(trainmeasures,testmeasures)                     #Merge by binding training and test rows of measurement data
testtrain  <- rbind(as.matrix(trainset),as.matrix(testset))         #Create a column identifying whether observation is from test or training set
mydata <- cbind(subjects,activities)                                #create two column dataframe with subject and activity numbers
mydata <- cbind(mydata,testtrain)                                   #Add set ID variable to dataframe
mydata <- cbind(mydata,measures)                                    #bind measure data to dataframe of subjects and activities


#2. Extract only the measurements on the mean and standard deviation for each measurement. 
#set initial names for columns (to be cleaned up later in the script)
names(mydata)[1:3] <- c('subjects','activities','set')                    #Appropriately name subject and activity columns
names(mydata)[4:dim(mydata)[2]] <- as.character(featurelabels[[1]]) #Set initial feature names

#grep indexes for columns associated with means and standard deviations
indexmeans   <- grep('mean[()]',names(mydata)) #33 indices for columns with names containing 'mean' (excluding frequency means)
indexstds    <- grep('std[()]',names(mydata))  #33 indices for columns with names containing 'std' (excluding frequency means)
meansandstds <- c(names(mydata)[indexmeans],names(mydata)[indexstds])    #concatenation of variable names for both means AND standard deviations

# 3. Use descriptive names to name the activities in the data set
mydata$activities <- mapvalues(mydata$activities, from = c("1", "2", "3", "4","5","6"),
                               to = c("Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"))

# 4. Appropriately label the data set with descriptive variable names. 
newnames <- names(mydata[,meansandstds])
newnames <- tolower(newnames)
newnames <- gsub("^t","time-",newnames)
newnames <- gsub("^f","frequency-",newnames)
newnames <- gsub("bodybody","body",newnames)
newnames <- gsub("[()]","",newnames)

newnames <- gsub("acc","acceleration",newnames)
newnames <- gsub("gyro","gyroscope",newnames)
newnames <- gsub("mag","magnitude",newnames)
newnames <- gsub("body","body-",newnames)
newnames <- gsub("gravity","gravity-",newnames)

# 5. create tidy data set with the average of each mean/stdev variable for each activity and each subject.
#melt mydata into a 4 variable X 813621(79 means/stdevs X 10299 observations) observation dataframe
mydata_melted  <- melt(mydata, id.vars= c("subjects","activities","set"), measure.vars=meansandstds) 
#recast melted dataframe into a 180 (6 activities X 30 participants) X 81 (79 means/stdevs + subject and activity columns) dataframe
mydata_recasted <- dcast(mydata_melted, subjects + activities + set ~ variable,fun.aggregate = mean)
names(mydata_recasted)[4:dim(mydata_recasted)[2]] <- as.character(newnames) #set names to descriptive variable names from step 4 above
#write datafile to the present working directory, as a file of comma delineated values
write.table(mydata_recasted,'tidydata.txt',row.name=T)
