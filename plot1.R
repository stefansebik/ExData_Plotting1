# source file is downloaded from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# the script expect the source file "household_power_consumption.txt" being present in R working directory

# read and transform data (the same code for all 4 graphs)
data_full <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?",
  colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

data_sub <- subset(data_full, Date==c("1/2/2007") | Date=="2/2/2007")

DateTime <- strptime(paste(data_sub[,"Date"], data_sub[,"Time"]),"%d/%m/%Y %H:%M:%S")

data_sub <- data.frame(data_sub, DateTime)

# construct 1.graph and save as PNG file
png("plot1.png")
hist(data_sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
