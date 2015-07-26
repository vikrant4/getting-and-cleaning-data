# Code Book

## 1. Information about dataset

Dataset was retrieved on 28/04/2014 from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### Citation Request:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## 2. Notes to the work code run_analysis.R

* Download and unzip dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Basic description can be found in README.txt in the unziped file
* Change current directory so that the directory `UCI HAR Dataset` is in the working directory
* Run script run_analysis.R
* The tidy dataset will be created as `tidy_data.txt`

### Structure of the code

Script includes comments describing each steps. The script does following:

* Merges the training and the test sets into a single data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Provides descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Variables

1. `train_X`              Training set
2. `train_label`          Training labels
3. `train_subject`        Subjects of the Training set
4. `test_X`	              Test set
5. `test_label`	          Testing label
6. `test_subject`		      Subjects of the Test set
7. `features`			        List of all features
8. `activity_labels`	    Links the class labels with their activity name
9. `data`			            Combination of traing and test set
10. `extract_columns`	    Columns with all the mean or standard deviation variables
11. `read_features`		    Cleaned up variable names
12. `avgs`			            Indepedent tidy data set containing all the mean values of
                          each varialbe for each activity and subject