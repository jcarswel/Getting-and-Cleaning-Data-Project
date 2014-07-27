## read testing data
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

## Add column names to testing table
features <- read.table("./features.txt")[,2]
names(X_test) = features

## Subset with only mean and standard deviation values 
extractfeatures <- grepl("mean|std", features)
X_test = X_test[,extractfeatures]

## Add activity labels
activity_labels <- read.table("./activity_labels.txt")[,2]
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

## Merge all test data
testingdata <- cbind(as.data.table(subject_test), y_test, X_test)

## read training data
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

## Add column names to training table
names(X_train) = features

## Subset with only mean and standard deviation values
X_train = X_train[,extractfeatures]

## Add activity labels
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

## Merge all training data 
trainingdata <- cbind(as.data.table(subject_train), y_train, X_train)

## Merge test and train data
data = rbind(testingdata, trainingdata)

##adding labels
idlabels   = c("subject", "Activity_ID", "Activity_Label")
datalabels = setdiff(colnames(data), id_labels)
meltdata   = melt(data, id = idlabels, measure.vars = datalabels)

## Apply mean function to dataset using dcast function
tidydata   = dcast(meltdata, subject + Activity_Label ~ variable, mean)

write.table(tidydata, file = "./tidy_data.txt")



