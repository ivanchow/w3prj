---
title: "CodeBook"
author: "Ivan Chow"
date: "5/16/2020"
output: html_document
---

the run_analysis.R contains a function called - run_analysis()

after running the command:  source "run_analysis.R"

run the following function at the R prompt:

run_analysis() 

this function executes the following action:

1. combine datasets in the files: X_test.txt and X_train.txt
2. extract the mean and standard deviation from the measurements
3. name the activities to the data set
4. label the data set with descriptive names
5. create a tidy data set with the average of each variable for each activities and each subject

this function assumes the following files are at the current directory:
1. X_test.txt
2. X_train.txt
3. y_test.txt
4. y_train.txt
5. features.txt

At the end of the run_analysis() function, a R data.frame data:

x_ext

is created for the data.

the data.frame 

it has 83 columns.
79 columns are mean and standard deviations of activities from 30 different subjects.
columns: label and desc_label are integer and character descriptions of the activites labels.
label     desc_label
1            WALKING
2   WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4            SITTING
5           STANDING
6             LAYING

columns: subject and desc_subject are integer and character descriptions of the subjects, e.g.
subject    desc_subject
1         Subject 1





