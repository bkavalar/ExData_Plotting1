#plot3.R file for Exploratory Data Analysis Week 1 Project
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

#create third plot of project by plotting both Date and Time on x axis against Energy Sub Metering on y axis
#need to process as.POSIXct data and use line data plotting type and name axis labels per directions
#need to repeat for all three data plots in succession with color schema as required
subsetData$DateTime <- as.POSIXct(paste(as.character(subsetData$Date), subsetData$Time)); 
  plot(Sub_metering_1 ~ DateTime, subsetData, type = "l", xlab = "",
     ylab = "Energy Sub Metering");
  with(subsetData, points(Sub_metering_2 ~ DateTime, subsetData, type = "l", col = "red"));
  with(subsetData, points(Sub_metering_3 ~ DateTime, subsetData, type = "l", col = "blue"));
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub_metering_1   ", "Sub_metering_2   ",
                                                                        "Sub_metering_3   "))
#create png file of plot and save to drive
dev.copy(png, file = "plot3.png") 
dev.off()