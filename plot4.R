download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip",method="curl")
unzip("data.zip",exdir="./")
d<-read.csv("household_power_consumption.txt" ,sep=";")
g<-d[d$Date=="1/2/2007"|d$Date=="1/2/2007",]
g$Time <- strptime(paste(g$Date, g$Time), format="%d/%m/%Y %H:%M:%S")
g<-g[,-1]
g$Global_active_power<-as.numeric(as.character(g$Global_active_power))
png(filename="plot4.png",width=480,height=480)


par(mfcol = c(2,2))
with(g, {plot(Time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE)
  a<-as.numeric(min(g$Time))
  l<-c(a, a+86400, a+2*86400)
  axis(1, at=l, labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(g, points(Time, Global_active_power, type = "l"))
  plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering" , axes = F, frame.plot=TRUE)
  axis(1, at=l, labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(g, points(Time, Sub_metering_1, type = "l"))
  with(g, points(Time, Sub_metering_2, type = "l", col = "red"))
  with(g, points(Time, Sub_metering_3, type = "l", col = "blue"))
  legend("topright", pch = "--", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))          
  plot(Time, Voltage, type = "n", xlab = "", ylab = "Voltage (volts)" , axes = F, frame.plot=TRUE)
  axis(1, at=l, labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(g, points(Time, Voltage, type = "l"))
  plot(Time, Global_reactive_power, type = "n", xlab = "", ylab = "Global Reactive Power (kilowatts)" , axes = F, frame.plot=TRUE)
  axis(1, at=l, labels=c("Thu", "Fri", "Sat"))
  axis(2, yaxs = "r")
  with(g, points(Time, Global_reactive_power, type = "l"))
})



dev.off()

rm(g,d)