dat = read.csv("household_power_consumption.txt", na.strings="?", sep=";", stringsAs=F)

dat2 = dat1[dat1$Date=="1/2/2007" | dat1$Date=="2/2/2007",]
DateTime = paste(dat2$Date, dat2$Time)
DateTime = strptime(DateTime, "%d/%m/%Y %H:%M:%S")
dat3 = cbind(DateTime, as.data.frame(dat2))


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# subplot 1
plot(dat3$Global_active_power, type="l",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency", 
     col="black")

# subplot 2
plot(dat3$Voltage, xlab="datetime", ylab="Voltage", type="l")

# subplot 3
plot(dat3$DateTime, dat3$Sub_metering_1, type="l", col = "black",
     ylab="Engery sub metering", xlab="")
lines(dat3$DateTime, dat3$Sub_metering_2, col="red")
lines(dat3$DateTime, dat3$Sub_metering_3, col="blue")
legend("topright",  lty=1,col = c("black","red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"),
       box.lty=0)
box(lty=1) # redraw border to accomodate the part the legend has overwritten

# subplot 4
plot(dat3$Global_reactive_power, xlab="datetime",ylab="Global_reactive_power", type="l")

dev.off()




