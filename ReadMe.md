#Markdown file for Getting and Cleaning Data Course Project
##Patrick B. Williams

This is a ReadMe for the coursera course Getting and Cleaning Data. It uses the Samsung data  
provided by the course as input for the run\_analysis.R script included in this repository  
and outputs a tidy data file called tidydata.txt.

####About the submitted tidy file
The tidy file created by the _run\_analysis_ R script meets the tidy data principles of week 1,  
i.e., each measured variable is in one column and each different observation of each measured  
variable is in a different row.

#ReadMe

##Notes to run the run_analysis script successfully
- The run\_analysis.R script requires the libraries __plyr__ (for the _mapvalues_ function) and __reshape2__  
(for the _melt_ and _dcast_ functions).
- The run\_analysis.R script must be run with the working directory set to the base directory  
of the original dataset, i.e., setwd('~/UCI HAR Dataset')
  
##Script Walkthrough

The script proceeds through the following (explained in more detail in the CODEBOOK):

1. read in data for training and testing data, as well as activity and feature labels
	
2. Merge training and test sets to create one data set 
	- this is __step #1__ in the project instructions.
	
3. Extract only the measurements on the mean and standard deviation for each measurement  
	- this is __step #2__ in the project instructions.
	
4. Create descriptive names to name the activities in the data set 
	- this is __step #3__ in the project instructions.
	
5. Set up appropriate labels for the data set with descriptive variable names. 
	- this is a _precursor to step #4_ in the project instructions. The new names are not  
	applied to the dataset until the very end.
	
6. create and output tidy data set with the average of each mean/stdev variable for each  
activity and each subject. 
	- This is __step #5__ in the project instructions
	- includes the application of __step #4__ from project instructions (_e._ above).

