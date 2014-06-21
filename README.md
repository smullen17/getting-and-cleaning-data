getting-and-cleaning-data
=========================

getting and cleaning data


Objective:
Use the files to create a tidy data set containing the observed activity metrics, sujectID, and activityID and activity type.
Step1 Get data into working directory:
Files were provided via a zipped url
Download the folders and files underneath UCI HAR Dataset into  Rs working directory. 
In Rs working directory you will need:
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
Use the feature file to assign the labels for the metric columns
 Make a character vector to assign the subjectID and activityID columns
Add a new column with the respective activity labels
Remove all metric columns aside from std and mean
The result is tidy data set1

Aggregeated tidy data set1 to take only the mean for each metric for each subject and activitiy type
The result is tidy data set2

