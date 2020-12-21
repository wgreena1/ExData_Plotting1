#Loading data and cleanup
consumption<-read.delim( "household_power_consumption.txt", sep=";")
mydata<-subset(consumption, consumption$Date=="1/2/2007"|consumption$Date=="2/2/2007")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
library(lubridate)
mydata$date_time<-dmy_hms(paste(mydata$Date, mydata$Time))
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Voltage<-as.numeric(mydata$Voltage)
mydata$Global_reactive_power<-as.numeric(mydata$Global_reactive_power)

#PNG file opened, plot grid setup, and plot 1
png(file="plot4.png")
par(mfrow=c(2,2))
with(mydata, plot(date_time, Global_active_power, pch=NA, type="o", xlab=NA, ylab="Global Active Power (kilowatts)"))

#Plot 2
with(mydata, plot(date_time, Voltage, pch=NA, type="o", xlab="datetime"))

#Plot 3
with(mydata, plot(date_time, Sub_metering_1, type="o", pch=NA, ylab="Energy sub metering", xlab=NA))
points(mydata$date_time, mydata$Sub_metering_2, type="o", pch=NA, col="red")
points(mydata$date_time, mydata$Sub_metering_3, type="o", pch=NA, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), box.lty=0)

#Plot4 and PNG file closed
with(mydata, plot(date_time, Global_reactive_power, pch=NA, type="o", xlab="datetime", ygap.axis=0.1))
dev.off()
