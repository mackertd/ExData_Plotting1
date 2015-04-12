## Exploratory Data Analysis - Course Project 1 - Plot 3

## Set up the environment

require(dplyr)

## Let the user know the application is starting

print("The application is starting")

## Load File Function

loadfile <- function(directoryPath, filePath, colSep) {
      
      ## Form the path; handle the data file is in the same directory as the working directory
      
      if (directoryPath == "" ) {
            
            path <- file.path(filePath)
            
      } else {
            
            path <- file.path(directoryPath, filePath)
            
      }
      
      ## Get the data as data.frame
      
      data <- read.table(path, header = TRUE, stringsAsFactors = FALSE, sep = colSep)
      
      return(data)
      
} ## end loadfile function

## Set the file names and directories for each of the data files

# Current Directory

baseDirectory <- ""

# File Name

dataSetFile <- "household_power_consumption.txt"

# Columnn Seperator

seperator <- ";"

# Load the data file

powerData <- loadfile(baseDirectory, dataSetFile, seperator)

# Extract the data set

# Note the single digit days and month are expressed as single digits

dataSet <- filter(powerData, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date and Time

dateTime <- strptime(paste(dataSet$Date, dataSet$Time), "%d/%m/%Y %H:%M:%S")

# Add the column to the date frame

dataSet$dateTime <- dateTime

# Plot the graph
# Note read.table has the columns as character; convert to numeric to plot

plot(dataSet$dateTime, as.numeric(dataSet$Sub_metering_1), type="l", ylab="Energy sub metering", xlab = "")

# Add the second and thrid lines

lines(dataSet$dateTime, dataSet$Sub_metering_2, col = "Red")
lines(dataSet$dateTime, dataSet$Sub_metering_3, col = "Blue")

# Add the legend

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2)

# Export as PNG

print("Exporting the plot as a PNG")

dev.copy(png, file = "plot3.png", height=480, width=480)
dev.off()

print("Application complete")


