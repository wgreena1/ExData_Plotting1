#Loading data and cleanup
consumption<-read.delim( "household_power_consumption.txt", sep=";")
mydata<-subset(consumption, consumption$Date=="1/2/2007"|consumption$Date=="2/2/2007")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
library(lubridate)
mydata$date_time<-dmy_hms(paste(mydata$Date, mydata$Time))
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)

#Plot and save PNG file
png(file="plot3.png")
with(mydata, plot(date_time, Sub_metering_1, type="o", pch=NA, ylab="Energy sub metering", xlab=NA))
points(mydata$date_time, mydata$Sub_metering_2, type="o", pch=NA, col="red")
points(mydata$date_time, mydata$Sub_metering_3, type="o", pch=NA, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))
dev.off()
