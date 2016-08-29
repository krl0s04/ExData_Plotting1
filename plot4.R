# Code for Plot 4

#Reading the txt file
file <- read.table("household_power_consumption.txt", sep=";", header=T,na.strings = "?", nrows=  )

# Subsetting the data from the dates 2007-02-01 and 2007-02-02
top <- which(file$Date == "1/2/2007" & file$Time =="00:00:00")
bottom <- which(file$Date == "2/2/2007" & file$Time =="23:59:00")

finalList <- a[top:bottom,]

#Conversion of the Date and Time variables to Date/Time classes
finalList$dateTime <- as.POSIXlt( paste( finalList$Date , finalList$Time), format = "%d/%m/%Y %H:%M:%S" )

#Multiple plots in one page
library(datasets)
png(file="plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))
#Top left graph (plot2)
with(finalList, plot(dateTime,Global_active_power, type = "l", ylab="Global Active Power"))
#Top right graph
with(finalList, plot(dateTime,Voltage, type = "l", ylab="Voltage"))
#Bottom left graph (plot3)
with(finalList, plot(dateTime,Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = ""))
with(finalList, lines(dateTime,Sub_metering_2, col="red"))
with(finalList, lines(dateTime,Sub_metering_3, col="blue"))
legend("topright", legend = c(as.expression("Sub_metering_1"),as.expression("Sub_metering_2"),
                              as.expression("Sub_metering_3")), box.col = 0, lty = 1, col=c("black","red","blue"))
#Bottom right graph
with(finalList, plot(dateTime,Global_reactive_power, type = "l", ylab="Global Reactive Power"))

dev.off()