plot2<-function(){
        power<-read.table("household_power_consumption.txt",header = TRUE,
                          sep=";",nrows = 118770,
                          colClasses = c("character","character","numeric",
                                         "numeric","numeric","numeric","numeric",
                                         "numeric","numeric"),na.strings="?")
        library(dplyr)
        power.f<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")
        power.m<-mutate(power.f,DateTime=paste(power.f$Date,power.f$Time))
        power.m$DateTime<-strptime(power.m$DateTime,format="%d/%m/%Y %H:%M:%S")
        png(file="plot2.png",width = 480,height = 480)
        with(power.m, plot(x=DateTime,y=Global_active_power,type="l",
                           xlab = "", ylab = "Global Active Power (kilowatts)"))
        dev.off()
}