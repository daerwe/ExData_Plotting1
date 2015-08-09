mydata <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",
                   colClasses = c("factor",'factor','numeric','numeric',
                                  'numeric','numeric','numeric','numeric',
                                  'numeric'),na.strings='?')
df <- mydata[mydata$Date == '1/2/2007'|mydata$Date == '2/2/2007',]
df$datetime <- paste(df$Date,df$Time)
df$datetime <- strptime(df$datetime,format="%d/%m/%Y %H:%M:%S")
#plot2
png("plot2.png",width = 480,height = 480)
plot(df$datetime,df$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()