plot1 <- function(){

# Load data.
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Convert date.
df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Subset two days.
df <- df[df$Date == as.Date("2007-02-01") | df$Date == as.Date("2007-02-02"), ]

# Open device.
png('plot1.png')

# Draw histogram.
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

# Close device.
dev.off()

}