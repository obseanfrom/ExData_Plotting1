library(dplyr)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile = "EPC Graphs.zip")

unzip("EPC Graphs.zip",)
dir()

dataint <- "household_power_consumption.txt"
data <- read.table(dataint, head = TRUE, sep = ";", na.strings = "?")
tableraw <- as_tibble(data)

#check class
class(tableraw$Date)

#convert class (for future)
tableraw$Date <- as.Date(tableraw$Date,format = "%d/%m/%Y")

#make graph and export
png("plot1.png", width = 480, height = 480)
plot1data <- hist(tableraw$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()