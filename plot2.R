dat = read.csv("household_power_consumption.txt", na.strings="?", sep=";", stringsAs=F)

dat2 = dat1[dat1$Date=="1/2/2007" | dat1$Date=="2/2/2007",]
DateTime = paste(dat2$Date, dat2$Time)
DateTime = strptime(DateTime, "%d/%m/%Y %H:%M:%S")
dat3 = cbind(DateTime, as.data.frame(dat2))




png("plot2.png", width=480, height=480)
plot(dat3$DateTime, dat3$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()


