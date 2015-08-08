library(dplyr)

data <- read.csv("household_power_consumption.txt", sep = ";",
                 stringsAsFactors = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- paste(data$Date, data$Time, sep = " ")
data$Date <- strptime(data$Date, "%d/%m/%Y %T")

## Plot 2
png(file = "plot2.png")
with(data, plot(Date, Global_active_power,
                xlab = "", ylab = "Global Active Power (kilowatts)",
                type = "n"))
with(data, lines(Date, Global_active_power))
dev.off()