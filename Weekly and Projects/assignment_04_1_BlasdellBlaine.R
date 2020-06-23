# Assignment: ASSIGNMENT 4.1 Student Survey
# Name: Blasdell, Blaine
# Date: 2020-06-14

## Load the `readxl` library
library(readxl)
library(ggplot2)
library(pastecs)
library(e1071)  

## Read the file student-survey
student_df <- read.csv("data/Student-Survey.csv")

## Q1. Use R to calculate the covariance of the Survey variables and provide 
## an explanation of why you would use this calculation and what the results indicate.

## Covariance of time reading to time watching TV
read_to_tv <- cor(student_df$TimeReading,student_df$TimeTV)

## Covariance of time reading to Happiness
cor(student_df$TimeReading,student_df$Happiness)

## Covariance of time reading to gender
cor(student_df$TimeReading,student_df$Gender)

## Covariance of time tv watching to happiness
cor(student_df$TimeTV,student_df$Happiness)

## Covariance of time tv watching to Gender
cor(student_df$TimeTV,student_df$Gender)

## Covariance of Happiness to Gender
cor(student_df$Happiness,student_df$Gender)

## Q2.Examine the Survey data variables. What measurement is being used for the variables? 
## Explain what effect changing the measurement being used for the variables would have on the covariance calculation. 
## Would this be a problem? Explain and provide a better alternative if needed. 




