#Script2

directory<-"/Users/Gaia/Downloads"
setwd(directory)
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".")
library("dplyr")
data$Date<-as.Date (data$Date,format= "%d/%m/%Y")
data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02" )
data$DateTime=as.POSIXct(paste(data$Date,data$Time))
acrive_power<-as.numeric(data$Global_active_power)
plot(x=data$DateTime,y=active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
