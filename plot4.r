#read table and filter dates

dataset <- read.csv("household_power_consumption.txt", na.strings = "?", sep=";")
dataset <- filter (dataset, Date == "1/2/2007" | Date == "2/2/2007")

#create new variable posix containing date and time

dataset$posix <- paste(dataset$Date, dataset$Time, sep=" ")
dataset$posix <- dmy_hms(dataset$posix)

#Set 2 x 2 graphs and margins

par(mfrow=c(2,2))
par(mar = c(4,4,2,2))

with(dataset, {
        #graph in topleft corner
        plot(posix, Global_active_power, type ="l", xlab="", 
             ylab="Global active power")
        
        #graph in topright corner
        plot(posix, Voltage, type ="l", xlab="Datetime", ylab="Voltage")
        
        #graph in bottom left corner
        plot(posix, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(posix, Sub_metering_2, col = "red")
        lines(posix, Sub_metering_3, col="blue")
        legend("topright", col=c("black", "red", "blue"),
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
        
        #graph in bottomright corner
        plot(posix, Global_reactive_power, type ="l", xlab="Datetime")
})

dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()