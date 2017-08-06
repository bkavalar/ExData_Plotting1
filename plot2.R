#plot2.R file for Exploratory Data Analysis Week 1 Project
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

#create second plot of project by plotting both Date and Time on x axis against Global Active Power on y axis
#need to process as.POSIXct data and use line data plotting type and name axis labels per directions
subsetData$DateTime <- as.POSIXct(paste(as.character(subsetData$Date), subsetData$Time)); 
                        plot(Global_active_power ~ DateTime, subsetData, type = "l", xlab = "",
                             ylab = "Global Active Power (kilowatts)")

#create png file of plot and save to drive
dev.copy(png, file = "plot2.png" , width = 480, height = 480) 
dev.off()