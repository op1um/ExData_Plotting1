library(dplyr)

data <- read.csv("household_power_consumption.txt", sep = ";",
                 stringsAsFactors = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %T")

## Plot 3
png(file = "plot3.png")
with(data, plot(Date, Sub_metering_1,
                xlab = "", ylab = "Energy sub metering",
                type = "n"))
with(data, lines(Date, Sub_metering_1))
with(data, lines(Date, Sub_metering_2, col = "red"))
with(data, lines(Date, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))
dev.off()