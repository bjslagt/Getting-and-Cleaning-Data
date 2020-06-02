**Getting and Cleaning Data Project**

Author: [Bart Slagt](https://github.com/bjslagt/Getting-and-Cleaning-Data)

Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


**Review Criteria**

1. The submitted data set is tidy. [link to tidy dataset](https://github.com/bjslagt/Getting-and-Cleaning-Data/blob/master/tidy_data.txt)

2. The Github repo contains the required scripts. [link to script](https://github.com/bjslagt/Getting-and-Cleaning-Data/blob/master/run_analysis.R)

3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information. [link to codebook](https://github.com/bjslagt/Getting-and-Cleaning-Data/blob/master/codebook.md)

4. The README that explains the analysis files is clear and understandable. (I think it is clear)

5. The work submitted for this project is the work of the student who submitted it. (sure... (c) me!)


**DESCRIPTION OF THE run_analysis.R**

The R-Script will first load the describing features / subjects. It will then load the test data / keep only the standard deviation and mean columns and combine them into one table 'test'

After that it will do exactly the same for the train data -> into 1 table 'train'

After that it will combine the two tables into merged_data and fill in the 'activity parts' removing the activityID, so keeping only the activity name.

I'm using the reshape2 library to help me here. Just to quicken things.