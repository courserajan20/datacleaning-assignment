# Coursera: Getting and Cleaning Data Course Assignment

This repository holds all the files to submit the assignment.

### Contents 
  - `README.md`
  - `Codebook.md`
  - `run_analysis.R`
  - `tidy_data.txt`
  - `second_tidy_data.txt`
  
  
  ### Useage
  - Downlodad the `run_analysis.R` script.
  - In the R console type `source("File\Path/run_analysis.R")` to load this function to environment.
  - Now call the function by typing `run_analysis` in the cosole.
  
  ### Prerequisite
  This R used `dplyr` library. So make sure availibility of the package before running it.
  
  ### Working of the script
  - The function call `run_analysis` will download the source data(if required) and unzip it.
  - Then load data from the `.txt` files in the folder using `read.table()` function to R dataframe.
  - After all the individual files loaded properly, all of them will be concatenated into a single dataframe, i.e. training and testing data will be in the same table.
  - Now the column names will be added to the merged dataset, using the names found in `features` table.
  - From this dataset a subset will be prepared only using the columns having measurements recorded in `mean` and `standard deviation`. Also the `activity_code` and `subject` will be captured.
  - A new column `activity` will be added to this new table. The value of activity table will be the names of activities found in `activity_label.txt`.
  - The column names of this dataset is edited to make it better readable.
  - Now we are ready with a tidy dataset and this dataset will be saved to `tidy_data.txt` file.
  - From this tidy dataset an independed second table will be created which will contain average of each variable for each activty. This kind of like a summery table. This table will be written to a file `second_tidy_data.txt`.
  - All the unused variables and dataframes are deleted to free the RAM.
  
  ### Note:
  To know more about the variables of the dataset, take a look at `Codebook.md`.
  
  ### Source Citation
  The original data is take from UCI Machine Learning Repository to perform this assignment. Checkout [UCI's Page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for more information.
