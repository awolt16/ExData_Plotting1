household_power_consumption <- 
  read.csv("~/Math 377/Math 378 R/household_power_consumption.txt", 
           na.strings="?", sep=";", nrows = 70000,
           colClasses = rep(c("character", "numeric"), c(2, 7)))

data1<- subset(household_power_consumption, Date=="1/2/2007")
data2<- subset(household_power_consumption, Date=="2/2/2007")
data<- rbind(data1,data2)

dates<- as.POSIXct(paste(data$Date,data$Time),tz="GMT",format="%d/%m/%Y %H:%M:%S")

plot(dates,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()


