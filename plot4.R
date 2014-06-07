## url ---- https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## data dowloaded and unzipped locally

## data load

hpcom<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## Filter for 2007-02-01 and 2007-02-02
fildate<-subset(hpcom, Date == "1/2/2007" | Date=="2/2/2007")

## data and time paste and format
hpcom$Date1 <- strptime(hpcom$Date, format = "%d/%m/%Y")
fildate$DateTime2 <- paste(fildate$Date1, fildate$Time)


## Plot 4

par(mfrow=c (2,2))


plot(as.POSIXct(fildate$DateTime2), fildate$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

with(fildate, plot(as.POSIXct(fildate$DateTime2),fildate$Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(fildate, plot(as.POSIXct(fildate$DateTime2),fildate$Sub_metering_1, type="l",ylab="Energy sub metering", xlab=""))
points(as.POSIXct(fildate$DateTime2),fildate$Sub_metering_2, type="l", col="red")
points(as.POSIXct(fildate$DateTime2),fildate$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(fildate, plot(as.POSIXct(fildate$DateTime2),fildate$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

#PNG generation using graphic device

png("plot4.png")

par(mfrow=c (2,2))

plot(as.POSIXct(fildate$DateTime2), fildate$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

with(fildate, plot(as.POSIXct(fildate$DateTime2),fildate$Voltage, type="l", xlab="datetime", ylab="Voltage"))

with(fildate, plot(as.POSIXct(fildate$DateTime2),fildate$Sub_metering_1, type="l",ylab="Energy sub metering", xlab=""))
points(as.POSIXct(fildate$DateTime2),fildate$Sub_metering_2, type="l", col="red")
points(as.POSIXct(fildate$DateTime2),fildate$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(fildate, plot(as.POSIXct(fildate$DateTime2),fildate$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()