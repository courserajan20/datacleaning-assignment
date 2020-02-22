### This R scipt is fetching the dataset and performing some
### tidying taks and saving the result on text files.
### Refer the Codebook.md and README.md for for info.

run_analysis <- function() {
  
  ## libraries used
  library("dplyr")
  
  ## Get the dataset
  
  # Downloading the zip file, only if is not available already
  dest_filename <- "samsung_uci_dataset.zip"
  
  if (!file.exists(dest_filename)) {
    download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile = dest_filename, method = "libcurl")
  }
  
  # Unzip the zip file
  data_folder <- "UCI HAR Dataset"
  
  # Only if the file does not exist, otherwise use that one.
  if (!file.exists(data_folder)) {
    unzip(dest_filename)
  }
  
  
  ## Reading .txt data to table
  
  # activity names and ids
  activities <- read.table(paste0(data_folder, "/activity_labels.txt"), col.names = c("activity_id", "activity_label"))
  
  # feature names and ids
  features <- read.table(paste0(data_folder,"/features.txt"), as.is = TRUE)
  
  # Test dataset
  test_subject <- read.table(paste0(data_folder, "/test/subject_test.txt"))
  test_values <- read.table(paste0(data_folder, "/test/X_test.txt"))
  test_activity <- read.table(paste0(data_folder, "/test/y_test.txt"))
  
  # Training dataset
  train_sub <- read.table(paste0(data_folder, "/train/subject_train.txt"))
  train_values <- read.table(paste0(data_folder, "/train/X_train.txt"))
  train_activity <- read.table(paste0(data_folder, "/train/y_train.txt"))
  
  
  
  ###### Step:1 Merging training and test sets to create one dataset ##########
  
  # Combining all testing data
  test_set <- cbind(test_subject, test_values, test_activity)
  
  # Removing the unused 
  rm(test_activity, test_subject, test_values)
  
  # Combining training data
  train_set <- cbind(train_sub, train_values, train_activity)
  
  # Removing unused 
  rm(train_activity, train_sub, train_values)
  
  # One table of all the data
  merged_dataset <- rbind(train_set, test_set)
  
  # Remove unused
  rm(train_set, test_set)
  
  
  
  #######  
  #   Step:2 Extracts only the measurements on the mean and standard deviation for each measurement. 
  #######
  
  # First set the names to the columns 
  colnames(merged_dataset) <- c("subject", features[,2], "activity_code")
  
  # Select the colums having mean and std for each measurement
  selected_cols <- grep("activity_code|subject|mean|std", names(merged_dataset))
  
  selected_data <- merged_dataset[,selected_cols]
  
  # Removing the unused
  rm(merged_dataset)
  
  
  
  ##### Step:3 Providing descriptive activity names insed of a code ######
  
  # adding activity column to dataset, this col has the descriptive names of the activities
  selected_data <- mutate(selected_data, activity = activities$activity_label[activity_code])
  
  
  
  ##### Step :4 Appropritely naming the dataset variables #######
  
  # correcting the column names to a better readable form
  # chaining simmilar type of activity
  dataset_cols <- names(selected_data) %>%
    gsub(pattern = "[\\(\\)]", replacement = "") %>%  
    gsub(pattern = "^t", replacement = "TimeDomain.") %>%
    gsub(pattern = "std", replacement = "StandardDeviation") %>%
    gsub(pattern = "mean", replacement = "Mean") %>%
    gsub(pattern = "Acc", replacement = "Accelerometer") %>%
    gsub(pattern = "Gyro", replacement = "Gyroscope") %>%
    gsub(pattern = "Mag", replacement = "Magnitude") %>%
    gsub(pattern = "Freq()", replacement = "Frequency") %>%
    gsub(pattern = "^f", replacement = "FrequencyDomain.")
  
  
  # replaing with modified column names
  colnames(selected_data) <- dataset_cols
  
  # removing the activity_code column
  tidy_data <- select(selected_data, -activity_code)
  
  # write 1st dataset to file
  write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE, quote = FALSE)
  
  
  ##### Step:5 Second independent tidy dataset with the average of
  ##    each variable for each activity
  # This achived using dplyr::summarize_each() verb 
  
  second_dataset <- tidy_data %>% 
    group_by(subject, activity) %>%  # It is grouped so that subject wise activities get listed
    summarize_each(funs = mean)      # For avg of each activity mean is used
  
  
  # writing the second dataset to .txt file
  write.table(second_dataset, file = "second_tidy_data.txt", row.names = FALSE, quote = FALSE)
  
  # Removing all unused data
  rm(activities, features, data_folder, dataset_cols, dest_filename, selected_cols, selected_data, second_dataset)
}

              





