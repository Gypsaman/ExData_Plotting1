library(lubridate)
setwd("ElectricPowerConsumption")
epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")

epc$Date <- dmy(epc$Date)
epc$Time <- hms(epc$Time)
epc$DateTime <- epc$Date + epc$Time
epc <- subset(epc,epc$Date == ymd("20070201") | epc$Date == ymd("20070202"))

png(file="Plot3.png")
plot(epc$DateTime,epc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(epc$DateTime,epc$Sub_metering_1,type="l",col="black")
points(epc$DateTime,epc$Sub_metering_2,type="l",col="red")
points(epc$DateTime,epc$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)
dev.off()