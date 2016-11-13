setwd("ElectricPowerConsumption")
epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")

epc$Date <- dmy(epc$Date)
epc$Time <- hms(epc$Time)
epc$DateTime <- epc$Date + epc$Time
epc <- subset(epc,epc$Date == ymd("20070201") | epc$Date == ymd("20070202"))

png(file="Plot4.png")
par(mfrow=c(2,2))
plot(epc$DateTime,epc$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(epc$DateTime,epc$Voltage,type="l",xlab="datetime",ylab="Voltage")


plot(epc$DateTime,epc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(epc$DateTime,epc$Sub_metering_1,type="l",col="black")
points(epc$DateTime,epc$Sub_metering_2,type="l",col="red")
points(epc$DateTime,epc$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1,bty="n")

plot(epc$DateTime,epc$Global_reactive_power,type="l",xlab="datetime")
dev.off()