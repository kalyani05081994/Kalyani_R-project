#Installing Packages

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(tidyr)
library(ggplot2)


#importing files
daily_activity<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv")
#daily_calorie<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv")
#daily_Intensities<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv")
#daily_steps<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/dailySteps_merged.csv")
heartrate<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/heartrate_seconds_merged.csv")
hourly_calorie<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/hourlyCalories_merged.csv")
hourly_intensities<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/hourlyIntensities_merged.csv")
hourly_steps<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/hourlySteps_merged.csv")
sleep_day<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv")
weight_log<-read.csv("C:/Users/Kalyani/Desktop/Google certification/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv")


#not considering daily calories,intensities and steps as daily activity already have the
#merged format


#Data Cleaning
colnames(daily_activity)
glimpse(daily_activity)
summary(daily_activity)
sum(is.na(daily_activity))
sum(is.na(heartrate))
sum(is.na(hourly_calorie))
sum(is.na(hourly_intensities))
sum(is.na(hourly_steps))
sum(is.na(sleep_day))
sum(is.na(weight_log))
summary(weight_log)
str(weight_log)

#dropping fat column from weight_log because it contains 65 NAs of 67 obs and keeping 
#all the other data as no na value is present


weight_log<-subset(weight_log,select =-c(Fat))
str(weight_log)

#finding unique IDs for every dataframe based on which we will be able to merge the 
#data


#unique(daily_activity$Id)
n_distinct(daily_activity$Id)#33 obs.
n_distinct(daily_calorie$Id)#33 obs.
n_distinct(daily_Intensities$Id)#33 obs.
n_distinct(daily_steps$Id)#33 obs.
#n_distinct(heartrate$Id)#14 obs.
n_distinct(hourly_calorie$Id)#33 obs.
n_distinct(hourly_intensities$Id)#33 obs.
n_distinct(hourly_steps$Id)#33 obs.
n_distinct(sleep_day$Id)#24 obs.
#n_distinct(weight_log$Id)#8 obs.

#With only 8 obs. there is not much use of this data ,hence eliminating the same

colnames(heartrate)
str(heartrate)
library(lubridate)
str(sleep_day)

#removing duplicates from the data

sum(duplicated(daily_activity))
sum(duplicated(daily_calorie))
sum(duplicated(daily_Intensities))
sum(duplicated(daily_steps))
sum(duplicated(hourly_calorie))
sum(duplicated(hourly_intensities))
sum(duplicated(hourly_steps))
sum(duplicated(sleep_day))
distinct(sleep_day)
daily_sleep<-distinct(sleep_day)#removed duplicates


#daily calories,intensities and steps are considered in the daily activity dataframe hence
#those can be eliminated

#now working with the following dataframes after narrowing down and eliminating data provided
#daily_activity
#sleep_day1
#hourly_calorie
#hourly_intensities
#hourly_steps

colnames(daily_activity)
glimpse(daily_activity)
glimpse(daily_sleep)
daily_sleep_new<-rename(daily_sleep,ActivityDate = SleepDay)
glimpse(daily_sleep_new)

#for merging data consistency needs to be maintained,here converting all the activity 
#dates in same format(changing from char to date)


daily_activity$ActivityDate <-as.Date(daily_activity$ActivityDate, format="%m/%d/%Y")
glimpse(daily_activity)
daily_sleep_new$ActivityDate<- as.Date(daily_sleep_new$ActivityDate, format="%m/%d/%Y")

hourly_calorie$ActivityHour <- mdy_hms(hourly_calorie$ActivityHour)
glimpse(hourly_calorie)
hourly_intensities$ActivityHour <- mdy_hms(hourly_intensities$ActivityHour)
glimpse(hourly_intensities)
hourly_steps$ActivityHour <- mdy_hms(hourly_steps$ActivityHour)
glimpse(hourly_steps)

#merging the dataframes for the ease of analysis based on id and Activity hour/ActivityDate
#Total_hourly_activity=hourly_calorie +hourly_intensities+hourly_steps-------1
#daily_activity--------------------------------------------------------------2
#daily_activity_vs_sleep=daily_activity+daily_sleep_new----------------------3

Total_hourly_calories_intensities<-merge(hourly_calorie,hourly_intensities, by=c("Id", "ActivityHour"))
glimpse(Total_hourly_calories_intensities)
Total_hourly_activity<-merge(Total_hourly_calories_intensities,hourly_steps,by=c("Id", "ActivityHour"))
glimpse(Total_hourly_activity)
daily_activity_vs_sleep<-merge(daily_activity,daily_sleep_new,by=c("Id","ActivityDate"))
glimpse(daily_activity_vs_sleep)



#dataframes are narrowed down to 
#1.Total_hourly_activity----------------------------------------------------------------A
#2.daily_activity_vs_sleep--------------------------------------------------------------B
#3.daily_activity-----------------------------------------------------------------------C

#Adding column for day in daily_activity_vs_sleep & daily_activity

daily_activity_vs_sleep$ActivityDay<-weekdays(daily_activity_vs_sleep$ActivityDate)
glimpse(daily_activity_vs_sleep)
daily_activity$ActivityDay<-weekdays(daily_activity$ActivityDate)
glimpse(daily_activity)


#Dataframes are now ready for visualization
#There will be analysis based on 
#1. On Daily basis
#2. Throughout the day


#1. On Daily basis
#a. Calories burnt vs Steps taken

#ggplot(data = daily_activity)+geom_point(mapping = aes(x=Calories,y=TotalSteps))
ggplot(data = daily_activity)+geom_point(mapping = aes(x=TotalSteps,y=Calories,color=Calories))
#ggplot(data = daily_activity)+geom_point(mapping = aes(x=TotalDistance,y=Calories,color=Calories))
#ggplot(data = daily_activity)+geom_bar(mapping = aes(x=TotalSteps,y=Calories,color=Calories))

glimpse(daily_activity_vs_sleep)
#b. Calories burnt vs Sleep mins
ggplot(data = daily_activity_vs_sleep)+geom_point(mapping = aes(x=TotalMinutesAsleep,y=Calories,color=TotalMinutesAsleep))
daily_activity_vs_sleep$sleep_hours<-daily_activity_vs_sleep$TotalMinutesAsleep/60  
ggplot(data = daily_activity_vs_sleep)+geom_point(mapping = aes(x=sleep_hours,y=Calories,color=sleep_hours))

#c. Calories burnt vs day of the week
Day_wise_calories<-aggregate(x = daily_activity$Calories,               
          by = list(daily_activity$ActivityDay),              
          FUN = sum) 
#rename(Day_wise_calories$Days<-Day_wise_calories$Group.1)
#rename(Day_wise_calories$Calories<-Day_wise_calories$x)
colnames(Day_wise_calories)
days_of_week<-data.frame(Days=c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),Sr_no_days=c(1,2,3,4,5,6,7))
Day_wise_calories<-merge(Day_wise_calories,days_of_week,by=c("Days"))
days_of_week<-merge(days_of_week,Day_wise_calories,by=c("Days"))
write.csv(days_of_week,"C:/Users/Kalyani/Desktop/Google certification/days_of_week.csv",row.names = TRUE)
ggplot(data=Day_wise_calories)+geom_point(mapping = aes(x=Sr_no_days,y=Calories))
ggplot(data=Day_wise_calories)+geom_point(mapping = aes(x=Days,y=Calories))
days_Sequence<-read.csv("C:/Users/Kalyani/Desktop/Google certification/days_of_week.csv")
ggplot(data=days_Sequence)+geom_point(mapping = aes(x=Days,y=Calories))

summary(daily_activity)

#2. Throughout the day

daily_activity$Total_mins<-daily_activity$VeryActiveMinutes+daily_activity$FairlyActiveMinutes+
                               daily_activity$LightlyActiveMinutes+daily_activity$SedentaryMinutes
daily_activity$Total_hours<-daily_activity$Total_mins/60
mean(daily_activity$Total_mins)
daily_activity$percent_time_very_active<-(daily_activity$VeryActiveMinutes/daily_activity$Total_mins)*100
mean(daily_activity$percent_time_very_active)
max(daily_activity$percent_time_very_active)
daily_activity$percent_time_fairly_active<-(daily_activity$FairlyActiveMinutes/daily_activity$Total_mins)*100
daily_activity$percent_time_lightly_active<-(daily_activity$LightlyActiveMinutes/daily_activity$Total_mins)*100
daily_activity$percent_time_sedentary<-(daily_activity$SedentaryMinutes/daily_activity$Total_mins)*100
