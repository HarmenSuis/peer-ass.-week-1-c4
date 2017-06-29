setwd("Y:/Mijn Documenten/R-cursus/data")

## read in data, and name NA's
df<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## set time variable
finaldf <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finaldf$Date, finaldf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldf <- cbind(SetTime, finaldf)

##plot 4
par(mfrow=c(2,2))
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
plot(finaldf$SetTime, finaldf$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(finaldf$SetTime, finaldf$Voltage, type="l", xlab="date time", ylab="Voltage")
plot(finaldf$SetTime, finaldf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(finaldf$SetTime, finaldf$Sub_metering_2, type="l", col="red")
lines(finaldf$SetTime, finaldf$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(finaldf$SetTime, finaldf$Global_reactive_power, type="l", xlab="date time", ylab="Global_reactive_power")

dev.copy(png,'plot4.png')
dev.off()
