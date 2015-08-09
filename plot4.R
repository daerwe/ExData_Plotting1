mydata <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",
                   colClasses = c("factor",'factor','numeric','numeric',
                                  'numeric','numeric','numeric','numeric',
                                  'numeric'),na.strings='?')
df <- mydata[mydata$Date == '1/2/2007'|mydata$Date == '2/2/2007',]
df$datetime <- paste(df$Date,df$Time)
df$datetime <- strptime(df$datetime,format="%d/%m/%Y %H:%M:%S")
#plot4
png("plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))
plot(df$datetime,df$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")
plot(df$datetime,df$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")
plot(df$datetime,df$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(df$datetime,df$Sub_metering_2,col = "red")
lines(df$datetime,df$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = c(1,1),
       col = c("black","red","blue"),
       bty = "n")
plot(df$datetime,df$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()