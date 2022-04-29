if(!file.exists("./getcleandata")){dir.create("./getcleandata")}
download.file(fileurl, destfile = "./getcleandata/projectdataset.zip")
unzip(zipfile = "./getcleandata/projectdataset.zip", exdir = "./getcleandata")
        x_ <- read.table("./getcleandata/ Dataset/train/X_.txt")
        y_ <- read.table("./getcleandata/Dataset/train/y_.txt")
        subject_ <- read.table("./getcleandata Dataset/train/subject_.txt")
        
        features <- read.table("./getcleandata/ Dataset/features.txt")
        activityLabels = read.table("./getcleandata/ Dataset/activity_labels.txt")
        colnames(x_train) <- features[,2]
        colnames(y_train) <- "activityID"
        colnames(subject_train) <- "subjectID"
        colnames(x_test) <- features[,2]
        colnames(y_test) <- "activityID"
        colnames(subject_test) <- "subjectID"
        
        colnames(activityLabels) <- c("activityID", "activityType")
        
        alltrain <- cbind(y_train, subject_train, x_train)
        alltest <- cbind(y_test, subject_test, x_test)
        finaldataset <- rbind(alltrain, alltest)
        colNames <- colnames(finaldataset)
        
      
        mean_and_std <- (grepl("activityID", colNames) |  grepl("subjectID", colNames) |  grepl("mean", colNames) | grepl("std...", colNames
        
 tidySet <- aggregate(. ~subjectID + activityID, setWithActivityNames, mean)
        tidySet <- tidySet[order(tidySet$subjectID, tidySet$activityID), ]
    write.table(tidySet, "tidySet.txt", row.names = FALSE)
