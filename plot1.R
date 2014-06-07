## url ---- https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## data dowloaded and unzipped locally

## data load

hpcom<-read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

## Filter for 2007-02-01 and 2007-02-02
fildate<-subset(hpcom, Date == "1/2/2007" | Date=="2/2/2007")

## data and time paste and format
hpcom$Date1 <- strptime(hpcom$Date, format = "%d/%m/%Y")
fildate$DateTime2 <- paste(fildate$Date1, fildate$Time)


#fildate$DateTime <- paste(fildate$Date, fildate$Time)
#fildate$DateTime <- format(fildate$DateTime, format = "%d/%m/%Y %H:%M:%S")


## Plot 1

hist(fildate$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

#PNG generation using graphic device

png("plot1.png")

hist(fildate$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
