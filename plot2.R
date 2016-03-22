#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip",method="curl")
#unzip("data.zip",exdir="./")
d<-read.csv("household_power_consumption.txt" ,sep=";")
g<-d[d$Date=="1/2/2007"|d$Date=="1/2/2007",]
g$Time <- strptime(paste(g$Date, g$Time), format="%d/%m/%Y %H:%M:%S")
g<-g[,-1]
g$Global_active_power<-as.numeric(as.character(g$Global_active_power))
png(filename="plot2.png",width=480,height=480)

with(g, plot(Time, Global_active_power, type = "n", xlab = "daytime", ylab = "Global Active Power (kilowatts)" , axes = F, frame.plot=TRUE))
a<-as.numeric(min(g$Time))
axis(1, at=c(a, a+86400, a+2*86400), labels=c("Thu", "Fri", "Sat"))
axis(2, yaxs = "r")
with(g, points(Time, Global_active_power, type = "l"))

dev.off()

rm(g,d)