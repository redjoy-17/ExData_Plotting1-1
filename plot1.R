#Script1

directory<-"/Users/Gaia/Downloads"
setwd(directory)
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".")
library("dplyr")
data$Date<-as.Date (data$Date,format= "%d/%m/%Y")
data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02" )
active_power<-as.numeric(data$Global_active_power)
hist(x=active_power,xlim=c(0,6),ylim=c(0,1200),col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
