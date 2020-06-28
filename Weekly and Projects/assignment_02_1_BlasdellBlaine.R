# Assignment: ASSIGNMENT 2.1 Test Scores
# Name: Blasdell, Blaine
# Date: 2020-06-14

## Load the `readxl` library
library(readxl)
library(ggplot2)
library(pastecs)
library(e1071)  

## Read the file `data/acs-14-1yr-s0201.csv` to `census_df`
## Q1. What are the elements in your data (including the categories and data types)?
## A1. Census Date {ID, ID2, Geographic location, Population Group ID, Population Group Label, Races Reported, High School Degree(%), BS Degree (%)}
census_df <- read.csv("data/acs-14-1yr-s0201.csv")
head(census_df, 10)


## Q2. 2. Please provide the output from the following functions: str(); nrow(); ncol()
## A2. See Below
str(census_df)
cat("\nNumber of Rows:", nrow(census_df),"\n")
cat('\n')
cat("\nNumber of columns:",ncol(census_df))

## Q3. Create a Histogram of the HSDegree variable using the ggplot2 package.
## Q3a. Set a bin size for the Histogram. 
## Q3b. Include a Title and appropriate X/Y axis labels on your Histogram Plot.

ggplot(census_df, aes(HSDegree)) + geom_histogram(bins=30) + ggtitle('Census Population with High School Degree') + xlab('HS Degree (%)') + ylab('Count') 


## Q4. Answer the following questions based on the Histogram produced:
## Q4a. Based on what you see in this histogram, is the data distribution unimodal?
## A4a. Yes. it is unimodal. 

## Q4b. Is it approximately symmetrical?
## A4b. No. It is not symmetrical as it is a Left Skewed Distribution. Additionally Outliers in the 60s seem to prevent this.

## Q4c. Is it approximately bell-shaped?
## A4c. It is  unimodal which is what a bell curve is (although it is not uniform) and it is skewed.

## Q4d. Is it approximately normal?
## A4d. No it is not normal as it is not symmetrical. 

## Q4e. If not normal, is the distribution skewed? If so, in which direction? 
## A4e. Yes it is Left Skewed.

## Q4f. Include a normal curve to the Histogram that you plotted.
ggplot(census_df, aes(HSDegree)) + geom_histogram(aes(y=..density..), bins = 10)  + ggtitle('Census Population with High School Degree') + xlab('HS Degree (%)') + ylab('Count') + stat_function(fun = dnorm, args = list(mean = mean(census_df$HSDegree), sd = sd(census_df$HSDegree)),color="red", size=1, )

## Q4g. Explain whether a normal distribution can accurately be used as a model for this data.
## A4g. As this is skewed and not symmetrical a normal distribution would not work as a model.

## Q5. Create a Probability Plot of the HSDegree variable.
plt <- ggplot(census_df, aes(HSDegree)) + geom_histogram(aes(y=..density..), bins = 10)  + ggtitle('Census Population with High School Degree') + xlab('HS Degree (%)') + ylab('Count') + stat_function(fun = dnorm, args = list(mean = mean(census_df$HSDegree), sd = sd(census_df$HSDegree)),color="red", size=1, ) + geom_density(color="black", size=1)
plt


## Q6. Answer the following questions based on the Probability Plot:
## Q6a. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
## Q6b. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
## A6. The probability plot (Black Line) still appears to be skewed left. The mean is 87.6 and the median is 88.7. 
## A6. The graph is neither symmetrical or normal at those points although it is approaching normal.

## Q7. Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. 
## Q7. Include a screen capture of the results produced.
stat.desc(census_df$HSDegree, basic = TRUE, norm = FALSE)

##Q8. 8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. 
## In addition, explain how a change in the sample size may change your explanation?
##A8. As the points are clustered on the right side of the distribution, it is negatively skewed. The outliers in the 60s and 70s tend to 
## contribute to the outcome. With a Kurtosis of a positive value of 4.35, it is considered to be a leptokurtic or a fat-tailed distribution.
## Z-score for 70: 74.5 - 87.6/5.12 = - 2.56 (Used Excel to calculate based on book formula)
## Z-scoree for 90: 90.1-87.6/5.12 = .488
## The z-score helps us predict the probability that a person in this census would or would not have a High School Diploma. 
## This later will also help us determine the confidence of the data at different levels.
## This is a relatively small sample size. As the size of the sample were to increase the closer we should approach a normal distribution.
kurtosis(census_df$HSDegree)

