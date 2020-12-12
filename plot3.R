#Script3

directory<-"/Users/Gaia/Downloads"
setwd(directory)
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",dec=".")
library("dplyr")
data$Date<-as.Date (data$Date,format= "%d/%m/%Y")
data<-subset(data, Date >= "2007-02-01" & Date <= "2007-02-02" )
data$DateTime=as.POSIXct(paste(data$Date,data$Time))
sm1<-as.numeric(data$Sub_metering_1)
sm2<-as.numeric(data$Sub_metering_2)
sm3<-as.numeric(data$Sub_metering_3)
plot(x=data$DateTime,y=sm1,type="l",xlab="",ylab="Energy sub metering")
points(x=data$DateTime,y=sm2,type="l",col="red")
points(x=data$DateTime,y=sm3,type="l",col="blue")
legend("topright",lwd=2,lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.5)
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()

