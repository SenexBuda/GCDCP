# Code Book for UCI_HAR_Average_Means_And_StdDevs
Senex Buda  
October 18, 2016  

## Overview
This document is the code book for *UCI_HAR_Average_Means_And_StdDevs.txt*, a tidy data set providing the average mean and standard deviation for a collection of interesting measurements gathered from the smartphone sensors (accelerometer and gyroscope) pertaining to 30 human subjects performing 6 distinct activities in a study with the goal of determining the extent to which the 6 distinct activities could be distinguished by those measurements. Further details on the study and the data it generated are provided in the background section and references below.

This code book provides information and metadata for the data set in *UCI_HAR_Average_Means_And_StdDevs.txt* to assist in understanding, loading, interpreting, manipulating and analyzing the data.
This data set was derived by processing the *UCI_HAR_DataSet.zip* file that is published at [UCI Human Activity Recognition Using SmartPhones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).
The data processing was performed to make the data simpler and easier to use in an R environment and is described in detail in the Data Processing section below and the accompanying *README.md* file.

## Background

The following background information is quoted from [UCI Human Activity Recognition Using SmartPhones](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#):

        The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
        Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
        Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
        The experiments have been video-recorded to label the data manually. 
        The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
        The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
        The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
        The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
        From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The following additional details can be found in the *README.txt* file included in *UCI_HAR_DataSet.zip*:

        Features are normalized and bounded within [-1,1].

Much more detail is available in the reference material detailed in the References section below.



## Data Set Details

The data set has:

* 180 observations (one for each combination of the 30 subjects and 6 activities)
* a total of 68 variables of which two are subject and activity and the other 66 are average means or standard deviations for measurements of physical vector quantities for the subject/activity combination

### Variables

[1] Subject     
        
        anonymized integer identifiers (1-30) for the human subjects in the study

[2] Activity    
        
        factor representing the labels for the 6 different types of activity. 
        The valid values are:

                "LAYING"            
                "SITTING"           
                "STANDING"          
                "WALKING"           
                "WALKING_DOWNSTAIRS"
                "WALKING_UPSTAIRS"

Columns 3 to 68 are all numeric variables that have been normalized to be in the range [-1,1] and so are independent of the units in which they were original measured (g's for acceleration and radians per second for angular velocity). All of these variables are averages of the normalized values over all the measurements for each combination of subject and activity. See Background and References below for further details.
 
 The names and meanings of these 66 variables all follow a common pattern explained below:
 
*Domain*.*AccelerationSignalComponent*.*VectorQuantity*.*VectorProperty*.*SummaryStatistic*
 
 where:
 
 - *Domain* is the domain of measurement and has 2 possible values:

        - Time
        - Frequency
 
 - *AccelerationSignalComponent* is the component of the acceleration signal and has 2 possible values:
 
        - Gravity
        - BodyMotion
 
 - *VectorQuantity* is the physical vector quantity being measured and has 4 possible values listed below:
 
        - LinearAcceleration as measured by Smartphone Accelerometer
        - LinearJerk derived from Smartphone Accelerometer measurements
        - AngularVelocity as measured by Smartphone Gyroscope
        - AngularJerk derived from SmartPhone Gyroscope measurements
 
 - *VectorProperty* is the specific property of the physical vector quantity and has 4 possible values:
 
        - XComponent    X component of the vector quantity
        - YComponent    Y component of the vector quantity
        - ZComponent    Z component of the vector quantity
        - Magnitude     magnitude of the vector quantity
 
 - *SummaryStatistic* is the statistic used to summarize the measurements and has 2 possible values:
 
        - Mean          The arithmetic mean of the measurements
        - StdDev        The standard deviations of the measurement. Note that because the values have been normalized to be in the range [-1,1], some of the normalized standard deviations are negative.
        
Note that not all the combinations of *Domain*.*AccelerationSignalComponent*.*VectorQuantity*.*VectorProperty*.*SummaryStatistic* are meaningful or available. Variables 3-68 are exactly the meaningful and available combinations:
 
 [3] Time.Body.LinearAcceleration.XComponent.Mean       
 [4] Time.Body.LinearAcceleration.YComponent.Mean       
 [5] Time.Body.LinearAcceleration.ZComponent.Mean       
 [6] Time.Body.LinearAcceleration.XComponent.StdDev     
 [7] Time.Body.LinearAcceleration.YComponent.StdDev     
 [8] Time.Body.LinearAcceleration.ZComponent.StdDev     
 [9] Time.Gravity.LinearAcceleration.XComponent.Mean    
[10] Time.Gravity.LinearAcceleration.YComponent.Mean    
[11] Time.Gravity.LinearAcceleration.ZComponent.Mean    
[12] Time.Gravity.LinearAcceleration.XComponent.StdDev  
[13] Time.Gravity.LinearAcceleration.YComponent.StdDev  
[14] Time.Gravity.LinearAcceleration.ZComponent.StdDev  
[15] Time.Body.LinearJerk.XComponent.Mean               
[16] Time.Body.LinearJerk.YComponent.Mean               
[17] Time.Body.LinearJerk.ZComponent.Mean               
[18] Time.Body.LinearJerk.XComponent.StdDev             
[19] Time.Body.LinearJerk.YComponent.StdDev             
[20] Time.Body.LinearJerk.ZComponent.StdDev             
[21] Time.Body.AngularVelocity.XComponent.Mean          
[22] Time.Body.AngularVelocity.YComponent.Mean          
[23] Time.Body.AngularVelocity.ZComponent.Mean          
[24] Time.Body.AngularVelocity.XComponent.StdDev        
[25] Time.Body.AngularVelocity.YComponent.StdDev        
[26] Time.Body.AngularVelocity.ZComponent.StdDev        
[27] Time.Body.AngularJerk.XComponent.Mean              
[28] Time.Body.AngularJerk.YComponent.Mean              
[29] Time.Body.AngularJerk.ZComponent.Mean              
[30] Time.Body.AngularJerk.XComponent.StdDev            
[31] Time.Body.AngularJerk.YComponent.StdDev            
[32] Time.Body.AngularJerk.ZComponent.StdDev            
[33] Time.Body.LinearAcceleration.Magnitude.Mean        
[34] Time.Body.LinearAcceleration.Magnitude.StdDev      
[35] Time.Gravity.LinearAcceleration.Magnitude.Mean     
[36] Time.Gravity.LinearAcceleration.Magnitude.StdDev   
[37] Time.Body.LinearJerk.Magnitude.Mean                
[38] Time.Body.LinearJerk.Magnitude.StdDev              
[39] Time.Body.AngularVelocity.Magnitude.Mean           
[40] Time.Body.AngularVelocity.Magnitude.StdDev         
[41] Time.Body.AngularJerk.Magnitude.Mean               
[42] Time.Body.AngularJerk.Magnitude.StdDev             
[43] Frequency.Body.LinearAcceleration.XComponent.Mean          
[44] Frequency.Body.LinearAcceleration.YComponent.Mean          
[45] Frequency.Body.LinearAcceleration.ZComponent.Mean          
[46] Frequency.Body.LinearAcceleration.XComponent.StdDev        
[47] Frequency.Body.LinearAcceleration.YComponent.StdDev        
[48] Frequency.Body.LinearAcceleration.ZComponent.StdDev        
[49] Frequency.Body.LinearJerk.XComponent.Mean           
[50] Frequency.Body.LinearJerk.YComponent.Mean          
[51] Frequency.Body.LinearJerk.ZComponent.Mean          
[52] Frequency.Body.LinearJerk.XComponent.StdDev        
[53] Frequency.Body.LinearJerk.YComponent.StdDev        
[54] Frequency.Body.LinearJerk.ZComponent.StdDev        
[55] Frequency.Body.AngularVelocity.XComponent.Mean     
[56] Frequency.Body.AngularVelocity.YComponent.Mean     
[57] Frequency.Body.AngularVelocity.ZComponent.Mean     
[58] Frequency.Body.AngularVelocity.XComponent.StdDev   
[59] Frequency.Body.AngularVelocity.YComponent.StdDev   
[60] Frequency.Body.AngularVelocity.ZComponent.StdDev   
[61] Frequency.Body.LinearAcceleration.Magnitude.Mean   
[62] Frequency.Body.LinearAcceleration.Magnitude.StdDev         
[63] Frequency.Body.LinearJerk.Magnitude.Mean           
[64] Frequency.Body.LinearJerk.Magnitude.StdDev         
[65] Frequency.Body.AngularVelocity.Magnitude.Mean      
[66] Frequency.Body.AngularVelocity.Magnitude.StdDev    
[67] Frequency.Body.AngularJerk.Magnitude.Mean          
[68] Frequency.Body.AngularJerk.Magnitude.StdDev                 

## Instructions for loading the Data Set in R
The data set can be quickly and conveniently loaded into R using the following one-liner, assuming that the file is in the current working directory:

```r
read.table("UCI_HAR_Average_Means_And_StdDevs.txt", header=TRUE)
```

## Note on "Tidiness" of the Data Set

In [tidy data](https://www.jstatsoft.org/index.php/jss/article/view/v059i10/v59i10.pdf):

        1. Each variable forms a column.
        2. Each observation forms a row.
        3. Each type of observational unit forms a table.

In order to make the UCI HAR data tidy, the training subject, training activity, training feature, test subject, test activity and test feature tables were combined into a single table (see Data Processing section)

Careful consideration was given as to whether it was appropriate to try to identify and split out feature components for each of the features since there is a lot of regularity in their structure (see Variables subsection below).

However, as Wickham points out in his [seminal article on Tidy Data](https://www.jstatsoft.org/index.php/jss/article/view/v059i10/v59i10.pdf), the distinction between observations and variables is problem specific and depends upon the question to be answered and the nature of the analysis to be performed.

For simplicity, this data set retains the original measurement variables rather than factoring out components but it enhances their names for clarity, readability and consistency with R data frame column naming standards.

The enhanced variable names in this data set are also easy to use with the tidyr R package for gathering and separating the variables if that is deemed appropriate for a particular analysis.


## Data Processing

The *UCI_HAR_DataSet.zip* contains 2 groups (training and test) of 3 files (subject, activity, features) the together provide the data in the data set, while the metadata is provided in two separate files (containing the activity numbers/names and feature names / column numbers respectively). This packaging of the data set is not tidy and is awkward and inconvenient to use for manipulation and analsyis in R.

The *UCI_HAR_Average_Means_And_StdDevs.txt* was derived from the 6 data and 2 metadata files mentioned in the last paragraph by the following data processing perfomed by the *run_analysis.R* script:

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



## License

This data is being redistributed in accordance with the license from the original data source:

        License:
        Use of this dataset in publications must be acknowledged by referencing the following publication [1]
        
        [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
        Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
        International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
        
        This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. 
        Any commercial use is prohibited.
        
        Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

## References

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care. Volume 19, Issue 9. May 2013

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Català. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

