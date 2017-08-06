#plot1.R file for Exploratory Data Analysis Week 1 Project
#Author:  B. Kavalar    Date:  6 Aug 2017
setwd("C:/Backup/2017 IRAD/R Programming/JHU Data Science Course/Exploratory Data Analysis/Week 1/Project")

#install required data.table library
library(data.table)

#create energyData table and read in data from UCI file
energyData <- data.table()
energyData <- read.table("household_power_consumption.txt", sep = ";" , header = TRUE, dec = ".", na.strings = "?")

#convert Date column to correct format
energyData$Date <- as.Date(energyData$Date, format= "%d/%m/%Y")

#subset for required date range of 2007-02-01 through 2007-02-02
subsetData <- energyData[energyData$Date == "2007-02-01" | energyData$Date == "2007-02-02", ]

#create first plot of project for Global Active Power and creata labels per directions
hist(subsetData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#create png file of histogram plot1 and save to drive
dev.copy(png, file = "plot1.png", width = 480, height = 480) 
dev.off()