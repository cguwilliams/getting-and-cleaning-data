#CODEBOOK

This codebook explains the data collection methods for the study, along with  
subject identifier variables, measurement variables, and activity identifier  
variables. Some description is given to the original dataset where appropriate.

##Summary choices made
The original dataset contained multiple observations per participant (approximately 300 per participant)  
, per condition (six conditions as listed below), across 561 continuous variables. For this assignment,  
the dataset was first melted (via the reshape2 library) to only include 66 summary variables that  
measured means and standard deviations. following this step, the data were again reshaped (dcast function  
of reshape2 library) such that each participant data were summarized across the six levels of 'activity' listed in the section below:  
__Activity identifier variables__.

This process left a final dataset with 180 observations (30 participants X 6 activity conditions),  
and 66 measured variables, and two subject identifier variables.

In addition to this reshaping of the original data, all measures were renamed to be more  
easily understood. The variable descriptions included in the section __Measurement Variables__  
below reflect this change. Please see the original codebook file file 'features_info.txt'  
for the original variables and names.

##Subject identifier variables
- __subjects__ 

This variable provides a unique id number for each study participant.  However,  
it should be noted that this identifier is not unique to each row and appears six times,  
once for each activity that each participant took part in. These activities are coded as  
described in the next section.

- __set__

This variable identifies each row as belonging to either the test or training set.  May be
important for machine learning based analyses. This variable is also unique to the tidy data 
file, as it did not exist in the raw data.

##Activity identifier variables
- __activities__ - Each participant had movements measured in six different conditions.  
Original codes were 1, 2, 3, 4, 5, & 6. They were remapped to the values listed here:
	1. Standing
	2. Sitting
	3. Laying
	4. Walking
	5. Walking_Downstairs
	6. Walking_Upstairs


##Measurement variables 
###Description of data collection and measurement variable names
The features selected from the original database come from the accelerometer and gyroscope  
3-axial raw signals time-acceleration-XYZ and time-gyroscope-XYZ. These time domain signals
were captured at a constant rate of 50 Hz. Then they were filtered using a median filter  
and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.  
Similarly, the acceleration signal was then separated into body and gravity acceleration signals  
(time-body-acceleration-XYZ and time-gravity-acceleration-XYZ) using another low pass Butterworth  
filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to  
obtain Jerk signals (time-body-acceleratonjerk-xyz and time-body-gyroscopejerk-xyz). Also  
the magnitude of these three-dimensional signals were calculated using the Euclidean norm  
(time-body-accelerationmagnitude, time-gravity-accelerationmagnitude, time-body-accelerationjerkmagnitude,  
time-body-gyroscopemagnitude, time-body-gyroscopejerkmagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing  
frequency-body-acceleration-xyz, frequency-body-accelerationjerk-xyz, frequency-body-gyroscope-xyz,  
frequency-body-accelerationjerkmagnitude, frequency-body-gyroscopemagnitude, frequency-body-gyroscopejerkmagnitude.  

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. These variable names  
were modified for clarity in the tidy data file output by run_analysis.R

For the sake of this assignment, only the following summary variables were retained:

mean(): Mean value
std(): Standard deviation

These variable names were indexed using a grep command with the patterns 'mean[()]' and  
'std[()]', respectively.

Each column represents either the mean (mean) for one of the metrics listed above or its standard deviation (std).  
Each measurement is in either the _time_ or _frequency_ domain, and is further separated based on whether  
it is an X, Y, or Z coordinate.
 
###Full list of measurement variable names

Variable names are taken from the variables described above, in each direction (X,Y,Z),  
with both mean and std summary variables.
 
__TIME__

- __time-body-acceleration-mean-x__
- __time-body-acceleration-mean-y__
- __time-body-acceleration-mean-z__
- __time-gravity-acceleration-mean-x__
- __time-gravity-acceleration-mean-y__
- __time-gravity-acceleration-mean-z__
- __time-body-accelerationjerk-mean-x__
- __time-body-accelerationjerk-mean-y__
- __time-body-accelerationjerk-mean-z__
- __time-body-gyroscope-mean-x__
- __time-body-gyroscope-mean-y__
- __time-body-gyroscope-mean-z__
- __time-body-gyroscopejerk-mean-x__
- __time-body-gyroscopejerk-mean-y__
- __time-body-gyroscopejerk-mean-z__
- __time-body-accelerationmagnitude-mean__
- __time-gravity-accelerationmagnitude-mean__
- __time-body-accelerationjerkmagnitude-mean__
- __time-body-gyroscopemagnitude-mean__
- __time-body-gyroscopejerkmagnitude-mean__
- __time-body-acceleration-std-x__
- __time-body-acceleration-std-y__
- __time-body-acceleration-std-z__
- __time-gravity-acceleration-std-x__
- __time-gravity-acceleration-std-y__
- __time-gravity-acceleration-std-z__
- __time-body-accelerationjerk-std-x__
- __time-body-accelerationjerk-std-y__
- __time-body-accelerationjerk-std-z__
- __time-body-gyroscope-std-x__
- __time-body-gyroscope-std-y__
- __time-body-gyroscope-std-z__
- __time-body-gyroscopejerk-std-x__
- __time-body-gyroscopejerk-std-y__
- __time-body-gyroscopejerk-std-z__
- __time-body-accelerationmagnitude-std__
- __time-gravity-accelerationmagnitude-std__
- __time-body-accelerationjerkmagnitude-std__
- __time-body-gyroscopemagnitude-std__
- __time-body-gyroscopejerkmagnitude-std__

__FREQUENCY__

- __frequency-body-acceleration-mean-x__
- __frequency-body-acceleration-mean-y__
- __frequency-body-acceleration-mean-z__
- __frequency-body-accelerationjerk-mean-x__
- __frequency-body-accelerationjerk-mean-y__
- __frequency-body-accelerationjerk-mean-z__
- __frequency-body-gyroscope-mean-x__
- __frequency-body-gyroscope-mean-y__
- __frequency-body-gyroscope-mean-z__
- __frequency-body-accelerationmagnitude-mean__
- __frequency-body-accelerationjerkmagnitude-mean__
- __frequency-body-gyroscopemagnitude-mean__
- __frequency-body-gyroscopejerkmagnitude-mean__
- __frequency-body-acceleration-std-x__
- __frequency-body-acceleration-std-y__
- __frequency-body-acceleration-std-z__
- __frequency-body-accelerationjerk-std-x__
- __frequency-body-accelerationjerk-std-y__
- __frequency-body-accelerationjerk-std-z__
- __frequency-body-gyroscope-std-x__
- __frequency-body-gyroscope-std-y__
- __frequency-body-gyroscope-std-z__
- __frequency-body-accelerationmagnitude-std__
- __frequency-body-accelerationjerkmagnitude-std__
- __frequency-body-gyroscopemagnitude-std__
- __frequency-body-gyroscopejerkmagnitude-std__


