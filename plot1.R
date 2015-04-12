household_power_consumption <- 
  read.csv("~/Math 377/Math 378 R/household_power_consumption.txt", 
           na.strings="?", sep=";", nrows = 70000,
           colClasses = rep(c("character", "numeric"), c(2, 7)))

View(household_power_consumption)

data1<- subset(household_power_consumption, Date=="1/2/2007")
data2<- subset(household_power_consumption, Date=="2/2/2007")
data<- rbind(data1,data2)

data$Global_active_power<- as.numeric(data$Global_active_power)
par(mfcol=c(1,1))
hist(data$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
axis(1,at = seq(0, 3000, by = 1000),labels=c(0,1,2,3))

dev.copy(png,file="plot1.png")
dev.off()
