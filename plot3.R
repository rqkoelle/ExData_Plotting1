# Coursera - Exploratory Data Analysis
# plot 3.R - time series of sub-meter readings
# Rainer Koelle

# configure script - adapt as approrpriate
# raw data is stored in subfolder data
setwd("~/__PERFORMANCE/Courses/ExploratoryDataAnalysis/proj1")

# read in data
data <- read.table('data/household_power_consumption.txt', 
                   sep = ";", header = TRUE,
                   na.strings="?")

# coerce Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# subset data set
startDate <- as.Date("2007-02-01")
endDate   <- as.Date("2007-02-02")

data <- data[data$Date >= startDate &
              data$Date <= endDate ,]

# create datetime for time series
data$dt <- strptime(paste(data$Date, data$Time),
                    format = "%Y-%m-%d %H:%M:%S")


# configure plot for export
png(file = "plot3.png", width = 480, height = 480, units = "px")


# build graph
yLabel <- "Energy sub metering"

plot(data$dt, 
     data$Sub_metering_1,
     xlab = "",
     ylab = yLabel,
     type = "n")

lines(data$dt, data$Sub_metering_1)
lines(data$dt, data$Sub_metering_2, col="red")
lines(data$dt, data$Sub_metering_3, col="blue")

legendText <- colnames(data)[7:9]
legendColor <- c("black", "red", "blue")
legend("topright", 
       legend = legendText, 
       col = legendColor,
       lty = 1)

# deactivate graphic device
dev.off()