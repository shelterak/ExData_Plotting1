## Exploratory Data Analysis
# Plot 1

# Collect data for the two days we're examining
dat <- read_csv2("household_power_consumption.txt", 
                 na = c("?", "NA"))
dat <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create plot 1
hist(as.numeric(dat$Global_active_power), freq = TRUE, col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Copy plot to png file, close device
dev.copy(png, file = "plot1.png")
dev.off()
