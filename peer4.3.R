setwd("Y:/Mijn Documenten/R-cursus/data")

## read in data, and name NA's
df<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## set time variable
finaldf <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finaldf$Date, finaldf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldf <- cbind(SetTime, finaldf)

##plot 3
with(finaldf, {
        plot(Sub_metering_1 ~ SetTime, type = "l", 
        ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2 ~ SetTime, col = "Red")
        lines(Sub_metering_3 ~ SetTime, col = "Blue")
        })
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
dev.copy(png,'plot3.png')
dev.off()