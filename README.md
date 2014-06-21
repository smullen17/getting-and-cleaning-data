getting-and-cleaning-data
=========================

getting and cleaning data


Data Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 

Description:
Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 561 metrics were gathered for each activity.


Objective:
use the files to create a tidy data set containing the observed activity metrics, sujectID, and activityID and activity type.


Get data into working directory:
files were provided via a zipped url
first step was to download the folders and files underneath UCI HAR Dataset into  Rs working directory. In Rs working directory you will need:
  Folder called test
  Folder called train
  File called activities_labels.txt
  File called features.txt
  File called features_info.txt
  File called README.txt

From the test folder, download the following files into R:
X_test
y_test

From the train folder, download the following files into R:
X_train
y_train

Download activities_labels.txt, features.txt, features_info.txt into R:


Process:
Through the use of the dim function, you see the train files and test files can be combined via  cbind
Assign column headers
  use the feature file to assign the labels for the metric columns
  make a character vector to assign the subjectID and activityID columns
Add a new column with the respective activitiy labels
Remove all metric columns aside from std and mean
The result is tidy data set1

Aggregeated tidy data set1 to take only the mean for each metric for each subject and activitiy type
The result is tidy data set2

Description of the study: who did it, why they did it, how they did it.
Data Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 

Description:
Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 561 metrics were gathered for each activity.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data sets
561 metrics were observed 
70% of the observations went into the training set (x_train, y_train)  which was 7,352 observations
30% went into the test set (x_test, y_test) which was 2,947 observations

Each observation had both an activityId as well as a subjectID. ActivityID was saved
