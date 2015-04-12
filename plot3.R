household_power_consumption <- 
  read.csv("~/Math 377/Math 378 R/household_power_consumption.txt", 
           na.strings="?", sep=";", nrows = 70000,
           colClasses = rep(c("character", "numeric"), c(2, 7)))

data1<- subset(household_power_consumption, Date=="1/2/2007")
data2<- subset(household_power_consumption, Date=="2/2/2007")
data<- rbind(data1,data2)
View(data)

dates<- as.POSIXct(paste(data$Date,data$Time),tz="GMT",format="%d/%m/%Y %H:%M:%S")

plot(dates,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dates,data$Sub_metering_2,col="red")
lines(dates,data$Sub_metering_3,col="blue")
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1,col=c("black","red","blue"), cex=0.75)

dev.copy(png,file="plot3.png")
dev.off()

