#read table and filter dates

dataset <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";")
dataset <- filter (dataset, Date == "1/2/2007" | Date == "2/2/2007")

#create new variable posix containing date and time

dataset$posix <- paste(dataset$Date, dataset$Time, sep=" ")
dataset$posix <- dmy_hms(dataset$posix)

#plot graph and lines

with(dataset, {
        plot(posix, Sub_metering_1, type="l", xlab="", 
                   ylab="Energy sub metering")
        lines(posix, Sub_metering_2, col = "red")
        lines(posix, Sub_metering_3, col="blue")
        #create legend in topright corner
        legend("topright", col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty=1)
})

dev.copy(png, file="plot3.png", width=480, height=480)

dev.off()