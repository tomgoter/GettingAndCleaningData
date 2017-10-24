# Getting and Cleaning Data Final Project
## ReadMe for run_analysis.r
### Submitted by T. Goter - October 22, 2017

For this assignment we were asked to complete five objectives that would result in an independent and tidy dataset. The objectives as copied from the Coursera website are:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###*The process used in the run_analysis script does not assume the that the objectives need to be completed in the order that which they were listed on the Coursera website. Instead the process which seemed most logical to me was used. 

# Pre-processing Steps
1. The first thing that run_analysis does is to read in the *plyr*, *dplyr* and *tidyr* libraries. These libraries will be used throughout the script to varying degrees.
2. Next, paths to the source data are stored as variables to make it slightly easier to read the files later
3. Read the data using the *read.table* function. This function works very well with the source data and will default to reading in whitespace delimited files

# Main Body of Program
1. The columns are labeled with the variable names from the *features.txt* file. This is useful for selecting on the variables of interest further down the line. 
 + This is accomplished be storing over the original *colnames* of the test and train data sets with the data read from the *features.txt* file (column 2)
 + These variable labels are quite informational and the explanations in the *features_info.txt* file can be added to the codebook.md
2. Selecting on the variables of interest
 + This is done in two steps, but they could be completed in one.  Two steps were used for code readability
 + First step is to create a boolean object *std_mean_bool* using the *grepl* function to search for *std* and *mean* in the colnames 
 + One item to note is that there are columns with names including *meanFreq* which should not be selected. A regular expression was thus constructed to find *mean* as long as it wasn't followed by "F" - *mean[^F]*
 + The second part of selecting the columns of interest was to actually subset the datasets (i.e., train and test) with the boolean *std_mean_bool*
3. Merging the datasets 
 + Prior to merging the test and train datasets, the associated information - the subject and activity labels were merged to the datasets using the *cbind* function.
 + After the above was completed for both the test and train datasets, the test and train data was merged to a new dataset named *all_data*
 + The above step was completed using the *rbind* function as we are really appending more observations together - not variables
4. Appropriately labels the dataset
 + This was done in a couple of ways. The first step was to add column names for the subjectid and activity which were added to the dataset in step 3 above.  
 + These columns were appended at the beginning of the dataset, so they are columns 1 and 2 and are easily renamed simply by storing over the *colnames* of the appropriate column with a new character array.  
 + In this case the new columns were labeled "subjectid" and "activity" - Note that no underscore or capital letters were used to abide by the tidy data guidelines
 + The next step was to actually replace the activity ids with the more useful string which the id represents
 + The correspondence between activity label and activity is found in the *activity_labels.txt* file.
 + The process used to change the activity ids to the actual activity was a short six step *for* loop
 + The items in the first column of the *activity_labels* dataset are looped over. This represents the numbers 1 through 6 which are then keyed to the actual activities
 + For each step of the for loop - the *gsub* function is used to replace all instances of the activity label (i.e., 1, 2, ... or 6) with the appropriate activity label in the *activity* column of *all_data*
 + We now have appropriately labeled data - Yay!
5. Generate the new, independent dataset of the means of each variable by *subjectid* and *activity*
 + This step is completed in two substeps for readability but could be completed with one line.
 + The first step is to use the *groupby* function on the all_data dataset to apply the *subjectid* and *activity* as factors
 + The second step is to use the *summarize_all* function to generate the data table of interest. The *summarize_all* function is quite handy as it applies the provide summary function - in this case *mean* to all the columns/variables in the dataset.
 + The output of the previous step is stored as *average_data* which is the data set requested.
 + The dataset is written to a csv file named *average_data.csv*
 
## average_data is the independent, tidy dataset

# Summary
## Objectives-
* Merges the training and the test sets - this is completed in my step 3 above
* Extracts only the measurements on the mean and standard deviation  - This is completed in my step 2 above
* Uses descriptive activity names to name the activities in the data set - This is completed in my step 4 above
* Appropriately labels the data set with descriptive variable names. - This is completed in my step 1 above
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable - this is done in step 5 above.
