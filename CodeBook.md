##Getting and Cleaning Data Week 3 Course Project

From the Instructor Notes:
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

The requirements, as I interpret them, are:
1)
Merge the various data sets, key files together, selecting the required mean and standard deviation variables.
Write the resulting 'tidy' dataset to a text file
2)
Aggregate the tidy dataset on Activity, SubjectID, and Variable, providing the mean of the values for the grouping.
Write the resulting aggregated dataset to a text file
3)
Save the R code to a file
4)
Create a github repository for this project
Add the two data files and code file to source control
Commit and push the files to the github repository
5)
Upload the two data files via the Course Project UI
Provide the github repository URL

================================================================================================================
Data for this project is from the UCI Machine Learning Repository
Citation Request:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
URL:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws

Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Additional Information:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

=========================================================================================================================

The requirements for this project specify the following:
1) Variables should be on the mean and standard deviation
2) Any number of columns may be selected

Examination of the data revealed there are repeating sets of data for several sensors.
I choose to use what I determined to be a complete set of 'mean and standard deviation' variables for a single sensor on all three axes:
Sensor- Body Accelerometer
Mean Variables: 
  tBodyAcc-mean()-X renamed to mnBodyAccx
  tBodyAcc-mean()-Y renamed to mnBodyAccy
  tBodyAcc-mean()-Z renamed to mnBodyAccz
  tBodyAcc-std()-X  renamed to sdBodyACCx
  tBodyAcc-std()-Y  renamed to sdBodyACCy
  tBodyAcc-std()-Z  renamed to sdBodyACCz

Data were read into R Studio into a series of data frames
The data were then subsetted to the desired variables and key columns
No other filtering or exclusion of data were used beyond this point
Data sets were joined on key columns to enable replacing of source variable names with explicit key names and eventually renamed as indicated above for human readibility
A series of non-impacting data re-shaping functions were applied in preparation for the final mean aggregation requirement

The output are:
A 'tidy' data set comprised of 3 key columns and 6 variables
An 'aggregated' data set comprised of 2 key columns and 6 variables










- Its activity label. 
- An identifier of the subject who carried out the experiment. 
