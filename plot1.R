#Loading data and cleanup
consumption<-read.delim( "household_power_consumption.txt", sep=";")
mydata<-subset(consumption, consumption$Date=="1/2/2007"|consumption$Date=="2/2/2007")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)

#Plot and save PNG file 
png(file="plot1.png")
hist(mydata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
