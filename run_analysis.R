
# Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation

wantedmeasurements <- grep(".*mean.*|.*std.*", features[,2])
wantednames <- features[wantedmeasurements,2]
wantednames = gsub('-mean'," Mean ", wantednames)
wantednames = gsub('-std'," STD ", wantednames)
wantednames = gsub('[-()]',"", wantednames)

## Getting all the data sets
test <- read.table("UCI HAR Dataset/test/X_test.txt")[wantedmeasurements]
testType <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test2 <- cbind(testSubject,testType,test)

train <- read.table("UCI HAR Dataset/train/X_train.txt")[wantedmeasurements]
trainType <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train2 <- cbind(trainSubject, trainActivities, train)

## Merging everything into one data set

allData <- rbind(train2, test2)
colnames(allData) <- c("Subject", "Activity", wantednames)

## Creating Tidy data set

allData[,1] <- as.factor(allData[,1])
allData$Activity <- factor(allData$Activity, levels = activityLabels[,1], labels = activityLabels[,2])

tidy <- ddply(allData, .(Subject, Activity), function(x) colMeans(x[,3:81]))

write.table(tidy, "Tidy.txt")
