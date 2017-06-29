setwd("Y:/Mijn Documenten/R-cursus/data")

## read in data, and name NA's
df<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")

## set time variable
finaldf <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finaldf$Date, finaldf$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finaldf <- cbind(SetTime, finaldf)

## plot 1 + create PNG file of plot
hist(finalData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()


