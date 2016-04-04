#read table and filter dates

dataset <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";")
dataset <- filter (dataset, Date == "1/2/2007" | Date == "2/2/2007")

#create new variable posix containing date and time

dataset$posix <- paste(dataset$Date, dataset$Time, sep=" ")
dataset$posix <- dmy_hms(dataset$posix)

#plot graph

with(dataset, plot(posix, Global_active_power, type ="l", xlab="", 
                   ylab="Global active power (kilowatts"))

dev.copy(png, file="plot2.png", width=480, height=480)

dev.off()