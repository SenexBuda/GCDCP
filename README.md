# README
Senex Buda  
October 18, 2016  

## Repository Structure and Content
This repository contains the following files:

* *README.md* (this file)    
         Describes the structure and contents of this repository and how to use it.

* *UCI_HAR_Average_Means_And_StdDevs.txt*         
        A tidy data set derived by processing a subset of the *UCI_HAR_DataSet.zip* that is published at [UCI Machine Learning Repository Human Activity Recognition Using Smartphones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).The data processing was performed to make the data simpler and easier to use in an R environment and is described in detail in the *CodeBook.md* file.

* *CodeBook.md*           
        A code book for *UCI_HAR_Average_Means_And_StdDevs.txt*.
It provides information and metadata for the data set in this file to assist in understanding, loading, interpreting, manipulating and analyzing the data.

* *run_analysis.R*       
        An R script that creates the tidy summary data set contained in the *UCI_HAR_Average_Means_And_StdDevs.txt* file. The script is liberally commented to explain the code and the processing performed by this script is detailed in the *CodeBook.md* file. The script is provided to make the data processing reproducible. The script depends on the *dplyr* package which should be installed prior to running the script in the R environment. 
        
Briefly, the *run_analysis.R* script does the following:

1. downloads the original *Human Activity Recognition Using Smartphones* files from the UCI repository, 
2. unzips the downloaded files into the current working directory
3. reads the metadata files containing the activity names/codes and the feature names/column positions
4. reads the test data files (subjects, activities and features) and combines them into a single test data set
5. reads the training data files (subjects, activities and features) and combines them into a single training data set
6. combines the test data set from 4 with the training data set from 5 to produce a single data set containing all subject, activity and feature data from both training and test groups
7. extracts from the data set in 6 only the subject, activity and features that are means or standard deviations of measurements
8. replaces the cryptic activity codes with readable activity names
9. replaces the feature names with enhanced names that are clearer, more systematic, and that are consistent with R column naming standards
10. groups the data set by subject and activity factors
11. computes the average of all features for each subject and activity factor, placing the result in a new tidy data set
12. writes the tidy summarized data set from 11 to the file, *UCI_HAR_Average_Means_And_StdDevs.txt* 




