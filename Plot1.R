## (c) Oleg Shvaikovsky
##     Exploratory Data Analysis
##     week 1 
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

## Creating the histogram
hist(MyData$Global_active_power, main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

