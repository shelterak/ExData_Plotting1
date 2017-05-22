## Exploratory Data Analysis
# Plot 2

# Collect data for the two days we're examining
dat <- read_csv2("household_power_consumption.txt", 
                 na = c("?", "NA"))
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

# Format "Date" and "Time" and others
x <- paste(dat$Date, dat$Time, sep = " ")
dat$DateTime <- as.POSIXct(strptime(x, "%d/%m/%Y %H:%M:%S"))
dat$Global_active_power <- as.numeric(dat$Global_active_power)

# Construct Plot 2
plot(Global_active_power ~ DateTime, data = dat, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Copy plot to png file, close device
dev.copy(png, file = "plot2.png")
dev.off()
