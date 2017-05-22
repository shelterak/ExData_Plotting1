## Exploratory Data Analysis
# Plot 4

# Collect data for the two days we're examining
dat <- read_csv2("household_power_consumption.txt", 
                 na = c("?", "NA"))
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

# Format "Date" and "Time" and others
x <- paste(dat$Date, dat$Time, sep = " ")
dat$DateTime <- as.POSIXct(strptime(x, "%d/%m/%Y %H:%M:%S"))
dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1)
dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)
dat$Voltage <- as.numeric(dat$Voltage)


# Construct Plot 4 - set the par() settings
par(mfrow = c(2,2))

# Print first plot

mylim <- c(0,40)
plot(Sub_metering_1 ~ DateTime, data = dat, type = "n",
     ylim = mylim,
     xlab = "", ylab = "Energy sub metering")
points(Sub_metering_1 ~ DateTime, data = dat, type = "l",
     ylim = mylim,
     col = "black")
points(Sub_metering_2 ~ DateTime, data = dat, type = "l",
       ylim = mylim,
       col = "red")
points(Sub_metering_3 ~ DateTime, data = dat, type = "l",
       ylim = mylim,
       col = "blue")

# Add Legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = "solid")


# Copy plot to png file, close device
dev.copy(png, file = "plot4.png")
dev.off()
