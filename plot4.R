library(dplyr)

data <- read.csv("household_power_consumption.txt", sep = ";",
                 stringsAsFactors = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %T")

## Plot 4
png(file = "plot4.png")
par(mfrow = c(2, 2), mar = c(4,4,2,2))

#### 1
with(data, plot(Date, Global_active_power,
                xlab = "", ylab = "Global Active Power",
                type = "n"))
with(data, lines(Date, Global_active_power))
#### 2
with(data, plot(Date, Voltage, xlab = "datetime",
                type = "n"))
with(data, lines(Date, Voltage))
#### 3
with(data, plot(Date, Sub_metering_1,
                xlab = "", ylab = "Energy sub metering",
                type = "n"))
with(data, lines(Date, Sub_metering_1))
with(data, lines(Date, Sub_metering_2, col = "red"))
with(data, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       bty = "n", cex = 0.9,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))
### 4
with(data, plot(Date, Global_reactive_power, xlab = "datetime",
                type = "n"))
with(data, lines(Date, Global_reactive_power))

dev.off()