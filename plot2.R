## calculating memory required for project 1 - exploratory analysis week1
## rows * columns * 8 bits
bytes <- 2075259*9*8
MB <- bytes / (2^20)
print ( paste (round (MB, digits = 2), "MB is required"))

## downloading and reading the given data 
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "electricpowerconsumption.zip")
unzip ("electricpowerconsumption.zip")
data <- read.table ("household_power_consumption.txt", sep=";", header=T, stringsAsFactors = FALSE)
head (data)

## extracting the first 2 dates of feb 2007 
subdata <- subset (data, Date == "1/2/2007" | Date == "2/2/2007")

## first we will plot on the screen then we will export as PNG file 
## To plot with numbers convert measurements to numerics 
## (note: ? will be converted to NA)
subdata$Global_active_power <- as.numeric (subdata$Global_active_power)
## to get a detailed time wise plot we have to create a new column with both date and time
subdata$DateTime <- paste (subdata$Date, subdata$Time)
## changing the class of date and time 
subdata$DateTime <- strptime (subdata$DateTime, "%d/%m/%Y %H:%M:%S")
head (subdata$DateTime)
class (subdata$DateTime)
## plotting a X-Y plot with line type 
plot (subdata$DateTime, subdata$Global_active_power, xlab = " ", ylab="Global Active Power(kilowatts)", type = "l")
## exporting as a png file
png (file="plot2.png", width = 480, height = 480, units = "px")
plot (subdata$DateTime, subdata$Global_active_power, xlab = " ", ylab="Global Active Power(kilowatts)", type = "l")
dev.off ()











