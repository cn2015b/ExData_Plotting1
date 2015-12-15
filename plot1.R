##read all the data
all_the_data<-read.csv("household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_the_data$Date<-as.Date(all_the_data$Date, format="%d%m$y")

##subset the data 
data<-subset(all_the_data, subset=(Date >= "1/2/2007" & Date <= "2/2/2007"))
rm(all_the_data)

##plot and copy to png
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red",xlim=c(0,6))

dev.copy(png, file="plot1.png",height=480,width=480)
dev.off()
