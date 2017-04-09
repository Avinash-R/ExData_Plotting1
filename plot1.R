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
## first we have to change the class of date then subset the data
data$Date <- as.Date(data$Date, "%d/%m/%Y")
head (data$Date)
class (data$Date)
subdata <- subset (data, Date == "2007-02-01" | Date == "2007-02-02")

## first we will plot on the screen then we will export as PNG file 
## To plot the hist with numbers convert measurements to numerics 
## (note: ? will be converted to NA)
subdata$Global_active_power <- as.numeric (subdata$Global_active_power)
## plotting to the screen 
hist (subdata$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
## exporting as a png file
png (file="plot1.png", width = 480, height = 480, units = "px")
hist (subdata$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off ()







