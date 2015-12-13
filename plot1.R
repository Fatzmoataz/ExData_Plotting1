## Read the data into a data frame
data <-read.table(file="household_power_consumption.txt", sep=";", na.strings=c("?"), header=TRUE)
## Convert first column to date
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
## Subset the data where the dates are between 2007-02-01 and 2007-02-02
data <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
## Convert second column to time
data[,2] <- as.POSIXct(strptime(paste(data[,1],data[,2]),format="%Y-%m-%d %H:%M:%S"))
## Setting the margins
par("mar"=c(4,4,1,1))
## Drawing the histogram
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency")
## Saving in a png file
dev.copy(png,"plot1.png", height=480, width=480)
dev.off()