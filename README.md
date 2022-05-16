# Kalyani_R-project
Case Study: How Can a Wellness Technology Company Play It Smart?
 

Background
Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused smart products. Sršen used her background as an artist to develop beautifully designed technology that informs and inspires women around the world. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women. By 2016, Bellabeat had opened offices around the world and launched multiple products. Bellabeat products became available through a growing number of online retailers in addition to their own e-commerce channel on their website. The company has invested in traditional advertising media, such as radio, out-of-home billboards, print, and television, but focuses on digital marketing extensively. Bellabeat invests year-round in Google Search, maintaining active Facebook and Instagram pages, and consistently engages consumers on Twitter. Additionally, Bellabeat runs video ads on Youtube and display ads on the Google Display Network to support campaigns around key marketing dates. Sršen knows that an analysis of Bellabeat’s available consumer data would reveal more opportunities for growth. She has asked the marketing analytics team to focus on a Bellabeat product and analyze smart device usage data in order to gain insight into how people are already using their smart devices. Then, using this information, she would like high-level recommendations for how these trends can inform Bellabeat marketing strategy.
The case study has been divided into 6 phases of data analysis,

1.Ask

Here, Business task is clearly identified and key stakeholders are mentioned

Business Task: To analyze smart device usage data in order to gain insight into how consumers use non-Bellabeat smart devices. Using these insights recommendations for how the trends can help Bellabeat Marketing Strategy will be given.


Stakeholders:

1.	Urška Sršen: Bellabeat’s cofounder and Chief Creative Officer.
2.	Sando Mur: Mathematician and Bellabeat’s cofounder; key member of the Bellabeat executive team.
3.	Bellabeat marketing analytics team: A team of data analysts responsible for collecting, analyzing, and reporting data that helps guide Bellabeat’s marketing strategy.

2.Prepare

Dataset information and limitations:
1.	FitBit Fitness Tracker Data is a Kaggle data set which contains personal fitness tracker from thirty fitbit users. Thirty eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, and heart rate that can be used to explore users’ habits.

2.	Limitations are as follows:

a.	Data is not current,its 5 yr older
b.	Small Sample space i.e 30 users.
c.	This is a third party data hence not reliable.
d.	The data is not ROCCC (i.e Reliable, Original, Comprehensive, Current,Cited)

3.Process

1.R is used for the purpose of data manipulation, organizing, re-arranging  etc. for efficient analysis.
2.Cleaning the data ,looking for errors etc are the steps to be taken
3.Following is brief process for data transformation to be used in analysis phase
	Analyzing all the .csv files provided
	Eliminating files not needed for the analysis
	Checking for NAs
	Removing duplicate values
	Renaming for maintaining consistency




4.Analyze

For this phase following actions have been performed

1.Data was re-arranged to the needed format to perform analysis further.
2.Aggregation of data on basis of certain parameters was done to narrow down data frames for ease of analysis.
3.Certain manipulations were done on data to suit the need of required data for analysis

5.Share

In this stage of analysis various parameters were analysed to find relationships between the same.
On basis of the analysis certain relationships were obtained which would help in making the required recommendations for Bellabeat.

1.Below mentioned plot showcases the relationship between the Calories the users have burned w.r.t the step count.
There is a positive correlation.

![image](https://user-images.githubusercontent.com/43092462/168684093-1f8da3cd-33bc-4e08-9c56-daeb4dcfb9df.png)

 
2.As seen in the plot ,higher calorie burn is directly proportional to standard range of sleep which is 6-8 hours .The same is displayed in the plot where maximum number of data points lie between the range of 6-8 hours.

![image](https://user-images.githubusercontent.com/43092462/168684152-57595e97-eb9e-47c2-9c28-3b1a8f239d0c.png)

 
3.Here Tuesdays,Wednesdays and Thursdays show maximum calories burnt,the reason may be people are more active in mid weeks and they tend to become lazy as weekend approaches.

![image](https://user-images.githubusercontent.com/43092462/168684192-7d58fde3-dbdc-4f60-adf3-8116c48a41dc.png)

 
4.From the statistics shown here average sedentary mins shows maximum time percentage from the total time users are logged in and the least is for very active minutes,which indirectly says people are not investing their time in working out.

![image](https://user-images.githubusercontent.com/43092462/168684214-975b0e0e-c1e8-417a-9614-d485f465bc41.png)

6.Act

Following are the recommendations based on the findings

1.The Stats shows people are not very much into working out and leading a fit and healthy lifestyle. Bellabeat can use new ideas to motivate people into leading healthy lifestyle. By discounts on subscriptions or adding rewards for achieving certain milestone, appreciation from the Bellabeat online community etc can be included so that people feel motivated by using the app. Since we have noticed a positive correlation between calories burnt and the number of steps logged in, Bellabeat can include taking bot to keep encouraging people to keep going ,to walk more and to burn more calories which will help them to move towards healthier side.

2.Proper sleep adds to burning more calories even when sleeping. Including sleep monitor in the smart watch will help them analyze their sleep schedule and also to improve in lacking areas.

3.People seem to work more or indirectly they walk more or perform any other type of activity more in the start of the week and by the end of the week with enthusiasm of weekends they also avoid focusing on maintaining healthy habits like working out. Bellabeat can include 7 days workout challenges ,one for every day of week .On completion they will receive some kind of awards or appreciation which would keep them on track and motivate them.

4.With the sedentary life style led by many users ,even with the will to focus on healthy lifestyle, the nature of work becomes an obstacle. Bellabeat  can include hourly reminders for the users to have breaks ,may be a small walk break would definitely add  to the journey of loosing weight or being active ,healthy and fit.

 


