# Code book for Coursera Getting and Cleaning Data course project

This code book contains information on the data found in the file ‘tidy_data.txt’, located in this repository.

The structure of the data set is described in the Data section, its variables are listed in the Variables section, and the transformations that were carried out to obtain the tidied data set are given in the Transformations section.

## Data
 
The tidy_data.txt data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.

## Variables 

Each row contains the averaged signal measurements, for a given subject and activity.

### Identifiers 

* subject

Subject identifier, integer, ranges from 1 to 30.

* activity

Activity identifier, string with 6 possible values:

* WALKING: subject was walking
* WALKING_UPSTAIRS: subject was walking upstairs
* WALKING_DOWNSTAIRS: subject was walking downstairs
* SITTING: subject was sitting
* STANDING: subject was standing
* LAYING: subject was laying

### Measurements

All measurements are floating-point values, normalised and bounded within [-1,1].

The measurements are classified in two domains:

* Time-domain signals
* Frequency-domain signals.

Time-domain signals
* timeDomainBodyAccelerometerMeanX
* timeDomainBodyAccelerometerMeanY
* timeDomainBodyAccelerometerMeanZ
* timeDomainBodyAccelerometerStandardDeviationX
* timeDomainBodyAccelerometerStandardDeviationY
* timeDomainBodyAccelerometerStandardDeviationZ
* timeDomainGravityAccelerometerMeanX
* timeDomainGravityAccelerometerMeanY
* timeDomainGravityAccelerometerMeanZ
* timeDomainGravityAccelerometerStandardDeviationX
* timeDomainGravityAccelerometerStandardDeviationY
* timeDomainGravityAccelerometerStandardDeviationZ
* timeDomainBodyAccelerometerJerkMeanX
* timeDomainBodyAccelerometerJerkMeanY
* timeDomainBodyAccelerometerJerkMeanZ
* timeDomainBodyAccelerometerJerkStandardDeviationX
* timeDomainBodyAccelerometerJerkStandardDeviationY
* timeDomainBodyAccelerometerJerkStandardDeviationZ
* timeDomainBodyGyroscopeMeanX
* timeDomainBodyGyroscopeMeanY
* timeDomainBodyGyroscopeMeanZ
* timeDomainBodyGyroscopeStandardDeviationX
* timeDomainBodyGyroscopeStandardDeviationY
* timeDomainBodyGyroscopeStandardDeviationZ
* timeDomainBodyGyroscopeJerkMeanX
* timeDomainBodyGyroscopeJerkMeanY
* timeDomainBodyGyroscopeJerkMeanZ
* timeDomainBodyGyroscopeJerkStandardDeviationX
* timeDomainBodyGyroscopeJerkStandardDeviationY
* timeDomainBodyGyroscopeJerkStandardDeviationZ
* timeDomainBodyAccelerometerMagnitudeMean
* timeDomainBodyAccelerometerMagnitudeStandardDeviation
* timeDomainGravityAccelerometerMagnitudeMean
* timeDomainGravityAccelerometerMagnitudeStandardDeviation
* timeDomainBodyAccelerometerJerkMagnitudeMean
* timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation
* timeDomainBodyGyroscopeMagnitudeMean
* timeDomainBodyGyroscopeMagnitudeStandardDeviation
* timeDomainBodyGyroscopeJerkMagnitudeMean
* timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation

Frequency-domain signals

* frequencyDomainBodyAccelerometerMeanX
* frequencyDomainBodyAccelerometerMeanY
* frequencyDomainBodyAccelerometerMeanZ
* frequencyDomainBodyAccelerometerStandardDeviationX
* frequencyDomainBodyAccelerometerStandardDeviationY
* frequencyDomainBodyAccelerometerStandardDeviationZ
* frequencyDomainBodyAccelerometerMeanFrequencyX
* frequencyDomainBodyAccelerometerMeanFrequencyY
* frequencyDomainBodyAccelerometerMeanFrequencyZ
* frequencyDomainBodyAccelerometerJerkMeanX
* frequencyDomainBodyAccelerometerJerkMeanY
* frequencyDomainBodyAccelerometerJerkMeanZ
* frequencyDomainBodyAccelerometerJerkStandardDeviationX
* frequencyDomainBodyAccelerometerJerkStandardDeviationY
* frequencyDomainBodyAccelerometerJerkStandardDeviationZ
* frequencyDomainBodyAccelerometerJerkMeanFrequencyX
* frequencyDomainBodyAccelerometerJerkMeanFrequencyY
* frequencyDomainBodyAccelerometerJerkMeanFrequencyZ
* frequencyDomainBodyGyroscopeMeanX
* frequencyDomainBodyGyroscopeMeanY
* frequencyDomainBodyGyroscopeMeanZ
* frequencyDomainBodyGyroscopeStandardDeviationX
* frequencyDomainBodyGyroscopeStandardDeviationY
* frequencyDomainBodyGyroscopeStandardDeviationZ
* frequencyDomainBodyGyroscopeMeanFrequencyX
* frequencyDomainBodyGyroscopeMeanFrequencyY
* frequencyDomainBodyGyroscopeMeanFrequencyZ
* frequencyDomainBodyAccelerometerMagnitudeMean
* frequencyDomainBodyAccelerometerMagnitudeStandardDeviation
* frequencyDomainBodyAccelerometerMagnitudeMeanFrequency
* frequencyDomainBodyAccelerometerJerkMagnitudeMean
* frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
* frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency
* frequencyDomainBodyGyroscopeMagnitudeMean
* frequencyDomainBodyGyroscopeMagnitudeStandardDeviation
* frequencyDomainBodyGyroscopeMagnitudeMeanFrequency
* frequencyDomainBodyGyroscopeJerkMagnitudeMean
* frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation
* frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency

Transformations 

The following transformations were applied to the source data:

1. The activities and measurements were extracted from the source data.
2. The measurements of the mean and standard deviation were extracted for each measurement.
3. The variable names were replaced with descriptive variable names. 
4. The training data and the test data are merged
5. All intermediate data frames used are removed to conserve memory
6. The final data set was created with the average of each variable for each activity and each subject.

The collection of the source data and the transformations listed above were implemented by the run_analysis.R R script (see README.md file for usage instructions).
