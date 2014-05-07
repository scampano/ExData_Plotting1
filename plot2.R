plot2 <- function(){

# Load data.
df <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# Convert date.
df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Subset two days.
df <- df[df$Date == as.Date("2007-02-01") | df$Date == as.Date("2007-02-02"), ]

# Build time/date vector.
vecDateTime <- as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d%H:%M:%S")

# Set the right time zone.
Sys.setlocale("LC_TIME", "English")

# Open device.
png('plot2.png')

# Draw.
plot(vecDateTime, df$Global_active_power, xaxt = "n", type="l", ylab="Global Active Power (kilowatts)", xlab="")
r <- as.POSIXct(round(range(vecDateTime), "days"))
axis.POSIXct(1, at = seq(r[1], r[2], by = "day"), format = "%a")

# Close device.
dev.off()

}