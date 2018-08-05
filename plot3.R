plot3<-function(){
        power<-read.table("household_power_consumption.txt",header = TRUE,
                          sep=";",nrows = 118770,
                          colClasses = c("character","character","numeric",
                                         "numeric","numeric","numeric","numeric",
                                         "numeric","numeric"),na.strings="?")
        library(dplyr)
        power.f<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")
        power.m<-mutate(power.f,DateTime=paste(power.f$Date,power.f$Time))
        power.m$DateTime<-strptime(power.m$DateTime,format="%d/%m/%Y %H:%M:%S")
        png(file="plot3.png",width = 480,height = 480)
        with(power.m, plot(x=DateTime,y=Sub_metering_1,type="l",
                           xlab = "", ylab = "Energy sub metering"))
        with(power.m, points(x=DateTime,y=Sub_metering_2,type="l",
                             xlab = "", ylab = "Energy sub metering", col="red"))
        with(power.m, points(x=DateTime,y=Sub_metering_3,type="l",
                             xlab = "", ylab = "Energy sub metering", col="blue"))
        legend("topright",lty="solid",col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        dev.off()
}