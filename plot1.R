# Coursera - Exploratory Data Analysis
# plot1.R - histogram of Global Active Power
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

# configure plot for export
png(file = "plot1.png", width = 480, height = 480, units = "px")


# plot labels
mainTitle <- "Global Active Power"
xLabel <- "Global Active Power (kilowatts)"

# plot
hist(data$Global_active_power, 
     col = "red",
     main = mainTitle, xlab = xLabel)

# deactivate graphic device
dev.off()