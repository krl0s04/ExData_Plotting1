# Code for Plot 3

#Reading the txt file
file <- read.table("household_power_consumption.txt", sep=";", header=T,na.strings = "?", nrows=  )

# Subsetting the data from the dates 2007-02-01 and 2007-02-02
top <- which(file$Date == "1/2/2007" & file$Time =="00:00:00")
bottom <- which(file$Date == "2/2/2007" & file$Time =="23:59:00")

finalList <- a[top:bottom,]

#Conversion of the Date and Time variables to Date/Time classes
finalList$dateTime <- as.POSIXlt( paste( finalList$Date , finalList$Time), format = "%d/%m/%Y %H:%M:%S" )

# Plot of Energy sub metering(1,2,3) vs dateTime 
library(datasets)
png(file="plot3.png",width = 480, height = 480)
#sub metering 1
with(finalList, plot(dateTime,Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = ""))
#sub metering 2
with(finalList, lines(dateTime,Sub_metering_2, col="red"))
#sub metering 3
with(finalList, lines(dateTime,Sub_metering_3, col="blue"))
legend("topright", legend = c(as.expression("Sub_metering_1"),as.expression("Sub_metering_2"),
                              as.expression("Sub_metering_3")), lty = 1, col=c("black","red","blue"))

dev.off()