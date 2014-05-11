# Coursera - Exploratory Data Analysis
# plot4.R - 4 time series plots
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
png(file = "plot4.png", width = 480, height = 480, units = "px")

# define 4 plot arrangement
par(mfrow = c(2,2))

# plot1 - Global Active Power ###################
# plot labels
p1yLabel <- "Global Active Power"

# set up plot
plot(data$dt,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = p1yLabel)

# plot2 - Voltage #################################
# plot labels
p2yLabel <- "Voltage"
p2xLabel <- "datetime"

# set up plot
plot(data$dt,
     data$Voltage,
     type = "l",
     xlab = p2xLabel, ylab = p2yLabel)

# plot3 - sub-meter readings #######################
# plot labes
p3yLabel <- "Engergy sub metering"

# set-up plot
plot(data$dt,
     data$Sub_metering_1,
     type = "l",
     xlab = "", ylab = p3yLabel)

lines(data$dt, data$Sub_metering_2, col="red")
lines(data$dt, data$Sub_metering_3, col="blue")

legendText <- colnames(data)[7:9]
legendColor <- c("black", "red", "blue")
legend("topright", 
       legend = legendText, 
       col = legendColor,
       lty = 1,     # legend symbol line
       bty = "n")   # no box around legend

# plot 4 - Global active power timeseries ##########
# plot labels
p4xLabel <- p2xLabel
p4yLabel <- colnames(data)[4]

# set up plot
plot(data$dt,
     data$Global_reactive_power,
     type = "l",
     xlab = p4xLabel, ylab = p4yLabel)


# deactivate graphic device
dev.off()