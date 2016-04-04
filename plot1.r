library(dplyr)
library(lubridate)

# Dowload the dataset and extract files

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="dataset.zip")
unzip("dataset.zip")

#read table and filter dates

dataset <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";")
dataset <- filter (dataset, Date == "1/2/2007" | Date == "2/2/2007")

#create new variable posix containing date and time

dataset$posix <- paste(dataset$Date, dataset$Time, sep=" ")
dataset$posix <- dmy_hms(dataset$posix)

#plot histogram

hist(dataset$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file="plot1.png", width=480, height=480)

#Turn off device

dev.off()
