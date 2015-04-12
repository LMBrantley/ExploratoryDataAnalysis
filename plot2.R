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

# Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#Save
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
