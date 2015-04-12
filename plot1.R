## Exploratory Data Analysis - Course Project 1 - Plot 1

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

hist(as.numeric(dataSet$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Export as PNG

print("Exporting the plot as a PNG")

dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()

print("Application complete")


