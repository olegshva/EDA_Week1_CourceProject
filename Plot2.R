## (c) Oleg Shvaikovsky
##     Exploratory Data Analysis
##     week 1 ::: PLOT 2 
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

DT <- paste(as.Date(MyData$Date), MyData$Time)
MyData$Datetime <- as.POSIXct(DT)

## Creating the plot
plot(MyData$Global_active_power ~ MyData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()