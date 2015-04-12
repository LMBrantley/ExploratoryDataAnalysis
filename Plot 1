setwd("C:/Users/C16Luke.Brantley/Documents/R/R-3.1.1/Math 377/Math 378")

alldat <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
alldat$Date <- as.Date(alldat$Date, format="%d/%m/%Y")

# Subset
dat <- subset(alldat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldat)

datetime <- paste(as.Date(dat$Date), dat$Time)
dat$Datetime <- as.POSIXct(datetime)

#Plot 1
hist(dat$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Save
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
