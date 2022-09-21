library(dplyr)
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile = "EPC Graphs.zip")

unzip("EPC Graphs.zip",)
dir()

dataint <- "household_power_consumption.txt"
data <- read.table(dataint, head = TRUE, sep = ";", na.strings = "?")
tableraw <- as_tibble(data)
tableraw <- subset(tableraw, tableraw$Date %in% c("1/2/2007","2/2/2007"))
tableraw$Date <- as.Date(tableraw$Date,format = "%d/%m/%Y")
tabletimeint <- paste(as.Date(tableraw$Date),tableraw$Time)
tableraw$tabletimedate <- as.POSIXct(tabletimeint)
#make graph and export
png("plot2.png", width = 480, height = 480)
plot(tableraw$Global_active_power~tableraw$tabletimedate,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()