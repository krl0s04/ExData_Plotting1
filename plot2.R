# Code for Plot 2

#Reading the txt file
file <- read.table("household_power_consumption.txt", sep=";", header=T,na.strings = "?", nrows=  )

# Subsetting the data from the dates 2007-02-01 and 2007-02-02
top <- which(file$Date == "1/2/2007" & file$Time =="00:00:00")
bottom <- which(file$Date == "2/2/2007" & file$Time =="23:59:00")

finalList <- a[top:bottom,]

#Conversion of the Date and Time variables to Date/Time classes
finalList$dateTime <- as.POSIXlt( paste( finalList$Date , finalList$Time), format = "%d/%m/%Y %H:%M:%S" )

# Plot of Global Active Power vs dateTime
library(datasets)
png(file="plot2.png",width = 480, height = 480)
with(finalList, plot(dateTime,Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = ""))
dev.off()