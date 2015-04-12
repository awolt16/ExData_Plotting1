household_power_consumption <- 
  read.csv("~/Math 377/Math 378 R/household_power_consumption.txt", 
           na.strings="?", sep=";", nrows = 70000,
           colClasses = rep(c("character", "numeric"), c(2, 7)))

data1<- subset(household_power_consumption, Date=="1/2/2007")
data2<- subset(household_power_consumption, Date=="2/2/2007")
data<- rbind(data1,data2)
dates<- as.POSIXct(paste(data$Date,data$Time),tz="GMT",format="%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))
plot(dates,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(dates,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(dates,data$Sub_metering_2,col="red")
  lines(dates,data$Sub_metering_3,col="blue")
  #legend("topright",col=c("black","blue","red"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dates,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(dates,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()