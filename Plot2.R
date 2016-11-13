setwd("ElectricPowerConsumption")
epc <- read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = "?")

epc$Date <- dmy(epc$Date)
epc$Time <- hms(epc$Time)
epc$DateTime <- epc$Date + epc$Time
epc <- subset(epc,epc$Date == ymd("20070201") | epc$Date == ymd("20070202"))

png(file="Plot2.png")
plot(epc$DateTime,epc$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
