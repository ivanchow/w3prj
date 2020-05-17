#1 merge data
merge_data <- function()
{
   print("Read data...")
   x_test  <- read.table("X_test.txt")
   x_train <- read.table("X_train.txt")
   y_test  <- read.table("y_test.txt") 
   y_train <- read.table("y_train.txt")
   subject_test  <- read.table("subject_test.txt")
   subject_train <- read.table("subject_train.txt")
   features <- read.table("features.txt")
  
   print("Merging data...")
   x_test$label <- y_test$V1
   x_test$subject <- subject_test$V1
   x_train$label <- y_train$V1
   x_train$subject <- subject_train$V1
   x_total <- rbind(x_test, x_train)
   print("...done")
   print("")  
}

#2 extract data
extract_data <- function()
{
   print("Extracting data...")
   x_ext <- x_total[, grepl("mean|std", as.character(features[,2]))]
   print("...done")
   print("")
}

#3 name activities
name_activities <- function()
{
   print("Name activities...")
   mean_std_features <- as.vector(features[grepl("mean|std", as.character(features[,2])),2])
   cnames <- c(mean_std_features, "label", "subject")
   colnames(x_ext) <- cnames
   print("...done")
}

#4 apply labels to desriptive variable names
apply_labels <- function()
{
   print("Apply labels...")
   x_ext$desc_label <- case_when((x_ext$label == 1) ~ "WALKING",  (x_ext$label == 2) ~ "WALKING_UPSTAIRS", (x_ext$label == 3) ~ "WALKING_DOWNSTAIRS", (x_ext$label == 4) ~ "SITTING", (x_ext$label == 5) ~ "STANDING", (x_ext$label == 6) ~ "LAYING")
   print("...done")
}

#5 create tidy data set
create_tidyData <- function()
{
   print("Create tidy dataset...")
   x_ext$desc_subject <- paste("Subject", as.character(x_ext$subject))
   print("...done")
}

run_analysis <- function()
{
   merge_data()
   extract_data()
   name_activities()
   apply_labels()
   create_tidyData()
   print("x_ext as a data.frame data is ready to be used.")
   print("type - summary(x_ext) at the command prompt to get the summary of the dataset.")
}