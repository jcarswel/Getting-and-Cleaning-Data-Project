ReadMe File for run_analysis.R script
========================================================

This is an R Markdown document that explains explains how all of the scripts work and how they are connected.

See CodeBook.md for explanation of data.

<h2> Before running script</h2>
1.  Store original data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
2.  Unzip data files
3.  Set working directory to the directory with the unzipped data files
4.  Install package data.table
5.  Install package reshape2
6.  Use library function to read in data.table package
7.  Use library function to read in reshape2 package

<h2> Working with testing data</h2>
1.  Lines 1 - 4 store in the data from the testing data
2.  Adds column headings from the features.txt file
3.  Extracts only the mean and standard deviation values from the testing data
4.  Adds activity labels and names to the testing data
5.  Merges all testing data together

<h2> Working with training data</h2>
1.  Lines 23-26, store in the data from the training data
2.  Adds column headings from the features.txt file
3.  Extracts only the mean and standard deviation values from the training data
4.  Adds activity labels and names to the training data
5.  Merges all training data together

<h2>Merging and creating new data set</h2>
1.  Merge training and testing data
2.  Add descriptive labels to merged data set
3.  Reformat merged data set with melt function
4.  Write out data set to file: tidy_data.txt








