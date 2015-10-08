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

# Plots histogram
hist(file$Global_active_power, ylim=range(0:1200), col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power", 
     cex.main=0.9, cex.axis=0.75, cex.lab=0.75)

# Exports graph to PNG graphic device
dev.copy(png, file="plot1.png")
dev.off()