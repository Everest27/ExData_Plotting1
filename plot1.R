plot1<-function(){
        power<-read.table("household_power_consumption.txt",header = TRUE,
                          sep=";",nrows = 118770,
                          colClasses = c("character","character","numeric",
                                         "numeric","numeric","numeric","numeric",
                                         "numeric","numeric"),na.strings="?")
        power$Date<-as.Date(power$Date,format="%d/%m/%Y")
        library(dplyr)
        power.f<-filter(power,Date=="2007-02-01"|Date=="2007-02-02")
        png(file="plot1.png",width = 480,height = 480)
        hist(power.f$Global_active_power, main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)", col="red")
        dev.off()
}