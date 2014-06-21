#read the files from your working directory
getwd()
setwd("C:/Users/smull2/R/cleaning_data")
x_test<-read.table("./test/X_test.txt",comment.char = "", colClasses="numeric")
y_test<-read.table("./test/y_test.txt", comment.char = "", colClasses="numeric")
x_train<-read.table("./train/X_train.txt", comment.char = "", colClasses="numeric")
y_train<-read.table("./train/y_train.txt", comment.char = "", colClasses="numeric")
sub_train<- read.table("./train/subject_train.txt", comment.char = "")
sub_test<-read.table("./test/subject_test.txt", comment.char = "")
features<-read.table("./features.txt",comment.char = "", stringsAsFactors = FALSE)
activity<-read.table("./activity_labels.txt",comment.char = "", stringsAsFactors = FALSE)

#assign column names to acitivity df
colnames(activity)<- c("Activity_Label", "Activity")

#test to see which files should be bound together based on dimesions
dim(y_test)
dim(x_test)
dim(sub_test)
dim(x_train)
dim(y_train)
dim(sub_train)
dim(features)
dim(activity)
dim(test_df)


#combine test files into one df (person,activity,measurements)
df_test_raw<-cbind(sub_test,y_test,x_test)

#combine train files into one df (person,activity,measurements)
df_train_raw<-cbind(sub_train,y_train,x_train)


#assign the feature column name to both dfs using the features.txt file
colnames(df_test_raw)[3:563]<-features[,2]
colnames(df_train_raw)[3:563]<-features[,2]

#assign column name for subjectID and activity_label
colnames(df_test_raw)[1:2]<-c("SubjectID","Activity_Label")
colnames(df_train_raw)[1:2]<-c("SubjectID","Activity_Label")

#combine the two dfs (i.e. appends the rows)
df_combined <- rbind(df_test_raw,df_train_raw) 

#subset to get std and mean columns only
mean_test <-df_combined[,grep("mean",colnames(df_combined))]
std_test <-df_combined[,grep("std",colnames(df_combined))]

#bind the std and mean columns back along with subjectID and activity_label
df_combined2 <- cbind(df_combined[,1:2],mean_test,std_test)

#merge on the activity label to get activity name
df_tidy1 <- merge(df_combined2, activity, by.x="Activity_Label", by.y="Activity_Label")
df_tidy2 <- aggregate(.~SubjectID+Activity_Label+Activity, data=df_tidy1, FUN=mean)

