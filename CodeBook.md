# Code Book

The script `run_analysis.R`cleans and mutates the raw data from the Samsung Galaxy S smartphone into tidy and more undstandable form by preforming the following steps
* Downloads the data sets from the cloudfront website and unzips the file
* Loads in the activity names and features
* Cleans up the measurement names and extract only the mean and standard deviation
* Combines all the data into one large data frame
* Creates a tidy data set and writes it to "Tidy.txt"

## Activity Labels
The following labels are used to distinguish the different activitys:
* WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

## Measurements
Using the phones accelerometer and gyroscope, the Samsung captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The tidy data only uses the mean and stardard deviation measurements of each measurement
