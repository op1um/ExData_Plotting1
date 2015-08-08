library(dplyr)

data <- read.csv("household_power_consumption.txt", sep = ";",
                 stringsAsFactors = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %T")

## Plot 1
data$Global_active_power <- as.numeric(data$Global_active_power)
png(file = "plot1.png")
hist(data$Global_active_power, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()