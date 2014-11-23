=================================================================

Readme.md : Course Project work of the class

"Getting and Cleaning Data" 

by Dr.Jeff Leek, Dr.Roger D. Peng,  Dr.Brian Caffo

https://class.coursera.org/getdata-009

=================================================================


Aim of the project is to merge the two data sets given and convert into a tidy dataset for easy reading with descriptive column names attached to the dataset. The dataset is further filtered for columns containing either mean() or std() words in their variable variables. The data on these columns are averaged for each subject(volunteer) and for each type of activity they took ( like walking, sitting etc).

#Dataset used for project work

The data set comes from the Human Activity Recognition Using Smartphones Dataset by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

#Background on the data provided

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using sensor signals (accelerometer and gyroscope) data were collected and filtered thru time window and a vector of features was obtained by calculating variables from the time and frequency domain. Out of the 561 features available, only mean and standard deviations are collected and archived. See 'codebook.md' for details on the columns filtered. 

#Project Output on Github repository Summary

1. har_meanstdsum.txt
    Final tidy dataset filtered and summrized from the original datasets provided. 
    There are a total of 180 records. Each record contains a total of 82 columns. First three columns corresponds to the identifiier:
    - An identifier of the subject(volunteer) who carried out the experiment.
    - type of the activity volunteer did perform. there are six different activity identifiers.
    - detailed description of the activity for each activity.
    - remaining 79 columns correspond to average measurements of parameters with column names containing either mean or std word.
        
2. Codebook.md
  detailed listing of the variables included in the dataset. Detailed steps included to merge the data sets, combine the variable
  names, filtering and grouping to generate the tidy dataset is also exaplianed.
  
3.Codebook.pdf
  detailed listing of the variables included in the dataset in well formatted .PDF format for easy reading. Detailed steps included
  to merge the data sets, combine the variable names, filtering and grouping to generate the tidy dataset is also exaplianed.
  
4.run_analysis.R
  R code used to generate the tidy dataset and write to the file.
  
5.Readme.md
  This file containing the relationship between all the files in the repository. 
