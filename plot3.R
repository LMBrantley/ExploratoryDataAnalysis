setwd("C:/Users/C16Luke.Brantley/Documents/R/R-3.1.1/Math 377/Math 378")

alldat <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
alldat$Date <- as.Date(alldat$Date, format="%d/%m/%Y")

# Subset
data <- subset(alldat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldat)

# Convert date
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
