# Sets the working directory for the cloned GitHub repo
setwd("/Users/nepomucenocabral/Dropbox/R/Coursera/ExData_Plotting1/")

# Loads the entire database and saves it to object 'file'
file=read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                na.strings=c("?",""))

# Converts variable class from factor to date
file$Date=as.Date(file$Date, format="%d/%m/%Y")

# Subsets only the observations for the days needed for the exercise
file=subset(file, Date=="2007-02-01" | Date=="2007-02-02")

# Merges the Date and Time variables into a single one
file$timetemp=paste(file$Date, file$Time)

# Converts the new date/time variable to Date/Time class
file$Time=strptime(file$timetemp, format="%Y-%m-%d %H:%M:%S")

# Opens the PNG graphic device on which the graph will be ploted
# This option was used instead of the function dev.copy due to distortions caused by the latter
png("plot4.png", width=560, height=560)

# Changes the default parameters so that the graphs will be ploted row-wise in a 2x2 array
par(mfrow=c(2,2))

# Plots graph 1 (top left)
plot(file$Time, file$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     cex.axis=0.8, cex.lab=0.8)

# Plots graph 2 (top right)
plot(file$Time, file$Voltage, type="l", ylab="Voltage", xlab="datetime",
     cex.axis=0.9, cex.lab=0.8)

# Plots graph 3 (bottom left)
plot(file$Time, file$Sub_metering_1, type="n", ylab="Energy sub metering",
     xlab="", cex.axis=0.8, cex.lab=0.8)
with(file, lines(file$Time, file$Sub_metering_1, col="black"))
with(file, lines(file$Time, file$Sub_metering_2, col="red"))
with(file, lines(file$Time, file$Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8, bty="n")

# Plots graph 4 (bottom right)
plot(file$Time, file$Global_reactive_power, type="l", ylab="Global_reactive_power", 
     xlab="datetime",
     cex.axis=0.9, cex.lab=0.8)

# Closes the PNG graphic device
dev.off()