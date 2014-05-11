# Coursera - Exploratory Data Analysis
# plot2.R - Global Active Power timeseries
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
png(file = "plot2.png", width = 480, height = 480, units = "px")


# plot labels
yLabel <- "Global Active Power (kilowatts)"

# plot
plot(data$dt,
     data$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = yLabel)

# deactivate graphic device
dev.off()