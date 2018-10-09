#Coursera Exploratory Data Analysis Assignment - Plot 1

#1) Extract data from file - as the file contains a lot of unecessary data, this piece of code
# is meant to extract only the subset used for the assignment

#function that finds the first line to be read - date 1/2/2007, time 00:00

first_line <- grep("1/2/2007", readLines("household_power_consumption.txt"))[1]-1

#calculates the number of rows to be read: 2 days, 24 hours, 60 minutes

n_row <- 2*24*60

#file name

fname <- "household_power_consumption.txt"

#reads the file

pwr_cons_data <- read.table(fname, skip = first_line, nrows = n_row, sep = ";", na.strings = "?")

#little trick to get colnames

header <- read.table(fname, nrow = 1, header = TRUE, sep = ";")

header_names <- names(header)

#naming data set columns

colnames(pwr_cons_data) <- header_names


#generate plot1 and save as png file

png(filename = "plot1.png", width = 480, height = 480)

hist(pwr_cons_data$Global_active_power,
     col = "red",
     ylim = c(0, 1200),
     main = "Global Active Power",
     ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)")

dev.off()
