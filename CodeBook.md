# Codebook of Tidy data Assignment 
### Course: "Getting and Clearing Data" Week4 - Programming Assignment



## Index
- `README.md` ~ For more general info on this repo.
- `tidy_data.txt` & `second_tidy_data.txt` ~ The datasets this codebook is explaining.
- [`run_analysis.R`](https://github.com/master/run_analysis.R) ~ The R script used to process the dataset.
- The Source Datafile used for this project [UCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
- [Data](#data) ~ Structure of the dataset.
- [Variables](#variables) ~ Variables found in the dataset.
- [NameChanges](#name-changes) ~ Change in variable names of the dataset.
- [Steps Performed](#steps) ~ Steps involved in processing of the dataset.



### Data <a name='data'></a>
The `second_tidy_data.txt` data file is a text file, containing space-separated values.

The first row of the dataset includes the name of the variables of the dataset or more precisely column names. These variables are described below in the [Variables](#variables) section. Other rows are the values of the variables.



### Variables <a name='variables'></a>
Each row contains value for subject, activity_code, activity and 79 other measurement data.

- `subject`
    This is an integer identifying the subject, who have performed the tasks.

- `activity`
 It identifies 6 different activities performed for the test. They are as follows
    - `WALKING`: subject was walking
    - `WALKING_UPSTAIRS`: subject was walking upstairs
    - `WALKING_DOWNSTAIRS`: subject was walking downstairs
    - `SITTING`: subject was sitting
    - `STANDING`: subject was standing
    - `LAYING`: subject was laying


Now comes the variables from `features.txt`. Only the *average*  and *standard deviation* measurement variables from the file are taken into consideration. The measurements are classified into two domains `Time Domain` and `Frequency Domain` signals.

### Time-domain data.

- Accelerometer Data(Body):
    - `TimeDomain.BodyAccelerometerMean-X`
    - `TimeDomain.BodyAccelerometerMean-Y`
    - `TimeDomain.BodyAccelerometerMean-Z`
    - `TimeDomain.BodyAccelerometerStandardDeviation-X`
    - `TimeDomain.BodyAccelerometerStandardDeviation-Y`
    - `TimeDomain.BodyAccelerometerStandardDeviation-Z`
    - `TimeDomain.BodyAccelerometerJerkMean-X`
    - `TimeDomain.BodyAccelerometerJerkMean-Y`
    - `TimeDomain.BodyAccelerometerJerkMean-Z`
    - `TimeDomain.BodyAccelerometerJerkStandardDeviation-X`
    - `TimeDomain.BodyAccelerometerJerkStandardDeviation-Y`
    - `TimeDomain.BodyAccelerometerJerkStandardDeviation-Z`
    - `TimeDomain.BodyAccelerometerMagnitudeMean`
    - `TimeDomain.BodyAccelerometerMagnitudeStandardDeviation`
    - `TimeDomain.BodyAccelerometerJerkMagnitudeMean`
    - `TimeDomain.BodyAccelerometerJerkMagnitudeStandardDeviation`

 - Accelerometer Data(Gravity):
    - `TimeDomain.GravityAccelerometerMean-X`
    - `TimeDomain.GravityAccelerometerMean-Y`
    - `TimeDomain.GravityAccelerometerMean-Z`
    - `TimeDomain.GravityAccelerometerStandardDeviation-X`
    - `TimeDomain.GravityAccelerometerStandardDeviation-Y`
    - `TimeDomain.GravityAccelerometerStandardDeviation-Z`
    - `TimeDomain.GravityAccelerometerMagnitudeMean`
    - `TimeDomain.GravityAccelerometerMagnitudeStandardDeviation`

- Gyroscope Data(Body):
    - `TimeDomain.BodyGyroscopeMean-X`
    - `TimeDomain.BodyGyroscopeMean-Y`
    - `TimeDomain.BodyGyroscopeMean-Z`
    - `TimeDomain.BodyGyroscopeStandardDeviation-X`
    - `TimeDomain.BodyGyroscopeStandardDeviation-Y`
    - `TimeDomain.BodyGyroscopeStandardDeviation-Z`
    - `TimeDomain.BodyGyroscopeJerkMean-X`
    - `TimeDomain.BodyGyroscopeJerkMean-Y`
    - `TimeDomain.BodyGyroscopeJerkMean-Z`
    - `TimeDomain.BodyGyroscopeJerkStandardDeviation-X`
    - `TimeDomain.BodyGyroscopeJerkStandardDeviation-Y`
    - `TimeDomain.BodyGyroscopeJerkStandardDeviation-Z`
    - `TimeDomain.BodyGyroscopeMagnitudeMean`
    - `TimeDomain.BodyGyroscopeMagnitudeStandardDeviation`
    - `TimeDomain.BodyGyroscopeJerkMagnitudeMean`
    - `TimeDomain.BodyGyroscopeJerkMagnitudeStandardDeviation`
    
    
### Frequency-domain data

- Accelerometer Data(Body):
    - `FrequencyDomain.BodyAccelerometerMean-X`
    - `FrequencyDomain.BodyAccelerometerMean-Y`
    - `FrequencyDomain.BodyAccelerometerMean-Z`
    - `FrequencyDomain.BodyAccelerometerStandardDeviation-X`
    - `FrequencyDomain.BodyAccelerometerStandardDeviation-Y`
    - `FrequencyDomain.BodyAccelerometerStandardDeviation-Z`
    - `FrequencyDomain.BodyAccelerometerMeanFrequency-X`
    - `FrequencyDomain.BodyAccelerometerMeanFrequency-Y`
    - `FrequencyDomain.BodyAccelerometerMeanFrequency-Z`
    - `FrequencyDomain.BodyAccelerometerJerkMean-X`
    - `FrequencyDomain.BodyAccelerometerJerkMean-Y`
    - `FrequencyDomain.BodyAccelerometerJerkMean-Z`
    - `FrequencyDomain.BodyAccelerometerJerkStandardDeviation-X`
    - `FrequencyDomain.BodyAccelerometerJerkStandardDeviation-Y`
    - `FrequencyDomain.BodyAccelerometerJerkStandardDeviation-Z`
    - `FrequencyDomain.BodyAccelerometerJerkMeanFrequency-X`
    - `FrequencyDomain.BodyAccelerometerJerkMeanFrequency-Y`
    - `FrequencyDomain.BodyAccelerometerJerkMeanFrequency-Z`
    - `FrequencyDomain.BodyAccelerometerMagnitudeMean`
    - `FrequencyDomain.BodyAccelerometerMagnitudeStandardDeviation`
    - `FrequencyDomain.BodyAccelerometerMagnitudeMeanFrequency`
    - `FrequencyDomain.BodyAccelerometerJerkMagnitudeMean`
    - `FrequencyDomain.BodyAccelerometerJerkMagnitudeStandardDeviation`
    - `FrequencyDomain.BodyAccelerometerJerkMagnitudeMeanFrequency`

- Gyroscope Data(Body):
    - `FrequencyDomain.BodyGyroscopeMean-X`
    - `FrequencyDomain.BodyGyroscopeMean-Y`
    - `FrequencyDomain.BodyGyroscopeMean-Z`
    - `FrequencyDomain.BodyGyroscopeStandardDeviation-X`
    - `FrequencyDomain.BodyGyroscopeStandardDeviation-Y`
    - `FrequencyDomain.BodyGyroscopeStandardDeviation-Z`
    - `FrequencyDomain.BodyGyroscopeMeanFrequency-X`
    - `FrequencyDomain.BodyGyroscopeMeanFrequency-Y`
    - `FrequencyDomain.BodyGyroscopeMeanFrequency-Z`
    - `FrequencyDomain.BodyGyroscopeMagnitudeMean`
    - `FrequencyDomain.BodyGyroscopeMagnitudeStandardDeviation`
    - `FrequencyDomain.BodyGyroscopeMagnitudeMeanFrequency`
    - `FrequencyDomain.BodyGyroscopeJerkMagnitudeMean`
    - `FrequencyDomain.BodyGyroscopeJerkMagnitudeStandardDeviation`
    - `FrequencyDomain.BodyGyroscopeJerkMagnitudeMeanFrequency`    



### NameChanges <a name='name-changes'></a>
Some variable names of the datasets are changed to better verbose form, which was initially in short form. For example `tBodyGyro-mean()-X` changed to `TimeDomain.BodyGyroscopeMean-X`. Simillarly the parts changed are listed below
`^t` to TimeDomain.
`std` to StandardDeviation
`mean` to Mean
`Acc` to Accelerometer
'Gyro` to Gyroscope
`Mag` to Magnitude
`Freq()` to Frequency
`^f` to FrequencyDomain
Some special characters such as `(`, `)`, `[`, `]`, `\\`, `\` are removed from the variable names.



### Seps Performed <a name='steps'></a>

The following steps are performed to tidy up the data. The following are according to the project guidelines on Coursera.
- Step:1 The training and test sets were merged to create one data set.
- Step:2 Only the measurements on the mean and standard deviation (i.e. signals containing the strings `mean` and `std`) were taken for each measurement.
- Step:3 The activity variable was using code to identify. A new column was added to accommodate descriptive activity names cited in the `activity_labels.txt` file.
- Step:4 The variable names were changed to a more readable format as described in the [NameChaneges](#name-changes) section. Save this dataset to `tidy_data.txt` file.
- Step:5 Lastly, from the dataset remaining after Step:4 data set a final dataset was created with the average of each variable for each activity and each subject. This is stored in the file `second_tidy_data.txt`.

*Note*: The R script used to tidy up the data can be found in [run_analysis.R](https://github.com/master/run_analysis.R)
