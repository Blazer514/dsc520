# Assignment: ASSIGNMENT 1.1 Test Scores
# Name: Blasdell, Blaine
# Date: 2020-06-07

## Load the `readxl` library
library(readxl)

## Read the file `data/scores.csv` to `scores_df`
## Q1. What are the observational units in this study?
## A1. Count of students with score in each section.
scores_df <- read.csv("data/scores.csv")
head(scores_df, 10)

## Q2. Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?
## A2. The variables are count (quantitative), score (categorical - not binary), and section (categorical - not binary, as there are only two values).
names(scores_df)


## Q3. Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.
## A3. reg_df is the list of regular section scores and sports_df in the list of the sports section scores
reg_df <- scores_df[scores_df$Section == 'Regular',]
reg_df
sports_df <- scores_df[scores_df$Section == 'Sports',]
sports_df

## Q4 Use the Plot function to plot each Sections scores and the number of students achieving that score.
## Use additional Plot Arguments to label the graph and give each axis an appropriate label. 
## Once you have produced your Plots answer the following questions:

## Plot of regular section scores
plot(reg_df$Score, reg_df$Count, main="Regular Section Scores by Student Count", ylab = "Total Students with Score", xlab = "Students Score", )
## Plot of sports section scores
plot(sports_df$Score, sports_df$Count, main="Sports Section Scores by Student Count", ylab = "Total Students with Score", xlab = "Students Score", )



##Q4a. Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: 
## Can you say that one section tended to score more points than the other? Justify and explain your answer.
##A4a. Both looking at the graph and the mean, the students in the Regular section tended to score higher then the Sports section.


## Averages
reg_df_avg <- sum(reg_df$Score*reg_df$Count) / sum(reg_df$Count)
reg_df_avg

sports_df_avg <- sum(sports_df$Score*sports_df$Count) / sum(sports_df$Count)
sports_df_avg

##Q4b. Did every student in one section score more points than every student in the other section? 
## If not, explain what a statistical tendency means in this context.
##A4b. As mentioned, the central tendency for the regular section to score higher holds true. That does not meant that every student in the Regular section 
## Scored higher then every student in the sports section. This is evidenced by the overall high score of 395 by the sports section. 
##

## Maximum of scores
max(sports_df$Score)
max(reg_df$Score)
## Minimum of Scores
min(sports_df$Score)
min(reg_df$Score)

##Q4c. c. What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions between the two sections?
##A4c. Time of day could be one variable that was not mentioned. It could affect whether students are more alert during class and taking tests. Another variable could be whether they are an athlete or not. Athletes would likely respond to sports related topics and retain it better.