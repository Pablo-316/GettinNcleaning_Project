

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. This .txt file contains the mean of each of the 79 features per subject and activity. There are 30 subjects and 6 activities in this file, and so the dimension of the dataset is 180 by 81. The two extra columns are the identifer variables (subject ID and activity).  

### Variables: 
#### 1. Identifier variables 
- subject: The subject associated with each piece of data 
- activity: The type of activities performed by the subject: walking, walking upstairs, walking downstairs, 
            sitting, standing, and laying. 
            
#### 2. Measurement variables

Each measurement is a feature mean. The original measurements were normalized by the original authors, so the final measurements are unitless and are from the [-1, 1] interval. The names of these features consist of three parts, namely, description, type of function, and orientation. For descriptions, there are 16 variations as listed below. 

- tBodyAcc: for time domain body accerlation 
- tGravityAcc for time domain gravity acceleration 
- tBodyAccJerk for time domain body acceleration 
- tBodyGyro for time domain gyroscope 
- tBodyGyroJerk for time domain gyroscope jerk 
- tBodyAccMag for time domain body acceleration magnitude
- tGravityAccMag for time domain body acceleration magnitude 
- tBodyAccJerkMag for time domain body jerk magnitude
- tBodyGyroMag for time domain body gyroscope magnitude
- tBodyGyroJerkMag for time domain body gyroscope jerk magnitude
- fBodyAcc for frequency domain body acceleration
- fBodyAccJerk for frequency domain body jerk
- fBodyGyro for frequency domain gyroscope
- fBodyAccMag for frequency domain acceleration magnitude
- fBodyAccJerkMag for frequency domain jerk magnitude
- fBodyGyroMag for for frequency domain gyroscope magnitude
- fBodyGyroJerkMag for frequency domain gyroscope jerk magnitude

For type of functions, it's either the mean or the standard deviation of the feature. 
For the orientation, it's either X, Y, or Z. As an example, the variable "tBodyAcc-mean()-X" is the time domain body acceleration mean in the X direction. 

### Data Processing
A) Merges the training and the test sets to create one data set. There are 2 datasets, one with the measurement values and another with the activity labels. The training and test sets were combined using *rbind()* for these two sets of datasets separately. 

B) Extracts only the measurements on the mean and standard deviation for each measurement. The list of features contain the word "mean" or "sd" were extracted from features.txt with *grep()*. Then the list of feature values associated with those features were stored in a new dataset. 

C) Uses descriptive activity names to name the activities in the data set. With the activity_labels.txt file, the activity labels were replaced by the actual activiy names. 

D) Appropriately labels the data set with descriptive variable names. The column names of the features were replaced by their own names from features.txt. The overall data was combined here with *cbind()*.   

E) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. With *ddply()*, the column averages were calculated for these 79 features per subject and activity. 



##Pablo Ramirez
##February, 2016