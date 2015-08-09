mydata <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",
                   colClasses = c("factor",'factor','numeric','numeric',
                                  'numeric','numeric','numeric','numeric',
                                  'numeric'),na.strings='?')
df <- mydata[mydata$Date == '1/2/2007'|mydata$Date == '2/2/2007',]
df$datetime <- paste(df$Date,df$Time)
df$datetime <- strptime(df$datetime,format="%d/%m/%Y %H:%M:%S")
#plot3
png("plot3.png",width = 480,height = 480)
plot(df$datetime,df$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(df$datetime,df$Sub_metering_2,col = "red")
lines(df$datetime,df$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1),
       col = c("black","red","blue"))
dev.off()