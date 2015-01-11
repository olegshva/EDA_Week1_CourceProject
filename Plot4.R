## (c) Oleg Shvaikovsky
##     Exploratory Data Analysis
##     week 1 ::: PLOT 4 
## ->  SANDBOX, week 1

setwd("/Users/olegshvaikovskypro/R-Coursera/ExploratoryDataAnalysis/Week1")

## Reading all the data
FullData <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
FullData$Date <- as.Date(FullData$Date, format="%d/%m/%Y")

## Subsetting the data from FullData
MyData <- subset(FullData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Cleaning the op.memory
rm(FullData)

## Change date-time format
DT <- paste(as.Date(MyData$Date), MyData$Time)
MyData$Datetime <- as.POSIXct(DT, tz = "UTC")

## Creating 4 plots, 2 x 2
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## plot by plot
with(MyData, {
     
##   1st
     plot(Global_active_power ~ Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="")

## 2nd
     plot(Voltage ~ Datetime, type="l", 
          ylab="Voltage (volt)", xlab="")

## 3rd
     plot(Sub_metering_1 ~ Datetime, type="l", 
          ylab="Global Active Power (kilowatts)", xlab="")


     lines(Sub_metering_2 ~ Datetime,col='Red')
     lines(Sub_metering_3 ~ Datetime,col='Blue')

## Adding a legend, at topright
     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
     legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## 4th
     plot(Global_reactive_power ~ Datetime, type="l", 
          ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
