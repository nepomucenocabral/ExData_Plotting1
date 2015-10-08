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
png("plot3.png", width=480, height=480)

# Plots base graph to which the lines will be annotated
plot(file$Time, file$Sub_metering_1, type="n", ylab="Energy sub metering",
     xlab="", cex.axis=0.8, cex.lab=0.8)

# Annotates lines for each variable
with(file, lines(file$Time, file$Sub_metering_1, col="black"))
with(file, lines(file$Time, file$Sub_metering_2, col="red"))
with(file, lines(file$Time, file$Sub_metering_3, col="blue"))

# Builds the legend used on the graph
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

# Closes the PNG graphic device
dev.off()