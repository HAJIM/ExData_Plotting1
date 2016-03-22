download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="data.zip",method="curl")
unzip("data.zip",exdir="./")
d<-read.csv("household_power_consumption.txt" ,sep=";")
g<-d[d$Date=="1/2/2007"|d$Date=="1/2/2007",]
g$Time <- strptime(paste(g$Date, g$Time), format="%d/%m/%Y %H:%M:%S")
g<-g[,-1]
g$Global_active_power<-as.numeric(as.character(g$Global_active_power))
png(filename="plot1.png",width=480,height=480)
hist(g$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim = c(0,1200))
dev.off()
rm(g,d)