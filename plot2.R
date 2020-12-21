#Loading data and cleanup
consumption<-read.delim( "household_power_consumption.txt", sep=";")
mydata<-subset(consumption, consumption$Date=="1/2/2007"|consumption$Date=="2/2/2007")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
library(lubridate)
mydata$date_time<-dmy_hms(paste(mydata$Date, mydata$Time))

#Plot and save PNG file
png(file="plot2.png")
with(mydata, plot(date_time, Global_active_power, pch=NA, type="o", xlab=NA, ylab="Global Active Power (kilowatts)"))
dev.off()
