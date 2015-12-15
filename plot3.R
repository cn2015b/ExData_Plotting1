##read all the data
all_the_data<-read.csv("household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

##convert dates
all_the_data$Date<-as.Date(all_the_data$Date,"%d/%m/%Y")

##subset
data<-subset(all_the_data,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##join date and time into a column named datetime
data$datetime <- paste(data$Date, data$Time)

##convert to date-time type 
data$datetime <- as.POSIXct(data$datetime)

##plot and copy to png
with(data,{
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power(kilowatts)",xlab="")
  lines(Sub_metering_2~datetime, col="Red")
  lines(Sub_metering_3~datetime,col="Blue")
})
legend("topright",col=c("black","red","blue"),lty=1,lwd=2,
       cex=0.5,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png",height=480,width=480)
dev.off()