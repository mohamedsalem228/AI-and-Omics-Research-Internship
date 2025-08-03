dir.create("data")
dir.create("script")
dir.create("results")
library("readxl")
data_patient <- read.csv(file.choose())
View("data_patient")
View(data_patient)
str(data_patient)
#data types 

class(data_patient)

#conversion
data_patient$bmi_fac <- as.factor(data_patient$bmi)

str(data_patient)

data_patient$gender <- as.factor(data_patient$gender)

data_patient$diagnosis <- as.factor(data_patient$diagnosis)

str(data_patient)

data_patient$smoker <- as.factor(data_patient$smoker)

data_patient$bmi_cat <- cut(data_patient$bmi,
                            breaks = c(-Inf, 18.5, 24.9, 29.9, Inf),
                            labels = c("Underweight", "Normal", "Overweight", "Obese"))

# using if else 
#1-detect patient risk 

data_patient$risk <- ifelse(data_patient$bmi > 25 & data_patient$smoker == "Yes", 
                            "High Risk", 
                            "Low/Moderate Risk")
#2-mark cancer patients 

data_patient$is_cancer <- ifelse(data_patient$diagnosis == "Cancer", 1, 0)

#3- age grouping 

data_patient$age_group <- ifelse(data_patient$age < 40, "Young", "Older")

# viewing 
View(data_patient)
