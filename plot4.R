#Script4

directory<-"/Users/Gaia/Downloads"
setwd(directory)
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".")
library("dplyr")
data$Date<-as.Date (data$Date,format= "%d/%m/%Y")
data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02" )
data$DateTime=as.POSIXct(paste(data$Date,data$Time))
active_power<-as.numeric(data$Global_active_power)
sm1<-as.numeric(data$Sub_metering_1)
sm2<-as.numeric(data$Sub_metering_2)
sm3<-as.numeric(data$Sub_metering_3)
voltage<-as.numeric(data$Voltage)
reactive_power<-as.numeric(data$Global_reactive_power)
#plot
par(mfrow=c(2,2))
#topleft
plot(x=data$DateTime,y=active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#topright
plot(x=data$DateTime,y=voltage,type="l",xlab="datetime",ylab="Voltage")
#bottomleft
plot(x=data$DateTime,y=sm1,type="l",xlab="",ylab="Energy sub metering")
points(x=data$DateTime,y=sm2,type="l",col="red")
points(x=data$DateTime,y=sm3,type="l",col="blue")
legend("topright",lwd=2,lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.25)
#bottomright
plot(x=data$DateTime,y=reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()

