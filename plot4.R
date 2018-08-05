plot4<-function(){
        power<-read.table("household_power_consumption.txt",header = TRUE,
                          sep=";",nrows = 118770,
                          colClasses = c("character","character","numeric",
                                         "numeric","numeric","numeric","numeric",
                                         "numeric","numeric"),na.strings="?")
        library(dplyr)
        power.f<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")
        power.m<-mutate(power.f,DateTime=paste(power.f$Date,power.f$Time))
        power.m$DateTime<-strptime(power.m$DateTime,format="%d/%m/%Y %H:%M:%S")
        png(file="plot4.png",width = 480,height = 480)
        par(mfcol=c(2,2),mar=c(6,4,0.5,2),oma=c(0,0,0,0))
        with(power.m,{
                plot(x=DateTime,y=Global_active_power,type="l",
                     xlab = "", ylab = "Global Active Power")
                plot(x=DateTime,y=Sub_metering_1,type="l",
                     xlab = "", ylab = "Energy sub metering")
                points(x=DateTime,y=Sub_metering_2,type="l",
                       xlab = "", ylab = "Energy sub metering", col="red")
                points(x=DateTime,y=Sub_metering_3,type="l",
                       xlab = "", ylab = "Energy sub metering", col="blue")
                legend("topright",lty="solid",col=c("black","red","blue"),
                       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                plot(x=DateTime,y=Voltage,type="l",xlab = "datetime",ylab="Voltage")
                plot(x=DateTime,y=Global_reactive_power,type="l",
                     xlab = "datetime",ylab="Global_reactive_power")
        })
        dev.off()
}