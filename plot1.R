
a <- read.table("household_power_consumption.txt", sep=";", header=T,na.strings = "?", nrows=  )
top <- which(a$Date == "1/2/2007" & a$Time =="00:00:00")
bottom <- which(a$Date == "2/2/2007" & a$Time =="23:59:00")

finalList <- a[top:bottom,]

library(datasets)
png(file="plot1.png")
hist(finalList$Global_active_power, main = "Global Active Power", col= "red", xlab = "Global Active Power (kilowatts)")
dev.off()