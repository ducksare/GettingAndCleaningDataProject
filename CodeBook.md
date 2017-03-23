# Code Book

The script `run_analysis.R`cleans and mutates the raw data from the Samsung Galaxy S smartphone into tidy and more undstandable form by preforming the following steps
* Downloads the data sets from the cloudfront website and unzips the file
* Loads in the activity names and features
* Cleans up the measurement names and extract only the mean and standard deviation
* Combines all the data into one large data frame
* Creates a tidy data set and writes it to "Tidy.txt"
