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

# Plots graph
plot(file$Time, file$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="",
     cex.axis=0.8, cex.lab=0.8)

# Exports graph to PNG graphic device
dev.copy(png, file="plot2.png")
dev.off()