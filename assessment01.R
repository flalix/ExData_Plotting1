getwd()
setwd("C:/bioinformatic/johns_hopkins/ExploratoryDataAnalysis/quizz")
dir()

# to git
# install.packages('histplot')

data <- read.csv("household_power_consumption.csv", sep=";")
head(data)
length(data)

gdata <- subset(data, 
       (strptime(data$Date, "%d/%m/%Y") >= strptime("1/2/2007", "%d/%m/%Y") ) &
       (strptime(data$Date, "%d/%m/%Y") <= strptime("2/2/2007", "%d/%m/%Y") )
)

# rm(data)

# paste(gdata$Date[1:10], gdata$Time[1:10])
gdata$DateTime = strptime( paste(gdata$Date, gdata$Time) , "%d/%m/%Y %H:%M")
# ?strptime
# gdata$DateTime

sys.source("C:/bioinformatic/johns_hopkins/ExploratoryDataAnalysis/quizz/clean.R")
sys.source("C:/bioinformatic/johns_hopkins/ExploratoryDataAnalysis/quizz/plot1.R")
sys.source("C:/bioinformatic/johns_hopkins/ExploratoryDataAnalysis/quizz/plot2.R")
sys.source("C:/bioinformatic/johns_hopkins/ExploratoryDataAnalysis/quizz/plot3.R")
sys.source("C:/bioinformatic/johns_hopkins/ExploratoryDataAnalysis/quizz/plot4.R")

gdata$Global_active_power = clean(gdata$Global_active_power, as.numeric, na.exclude)
gdata$Global_reactive_power = clean(gdata$Global_reactive_power, as.numeric, na.exclude)
gdata$Voltage = clean(gdata$Voltage, as.numeric, na.exclude)
gdata$Global_intensity = clean(gdata$Global_intensity, as.numeric, na.exclude)

gdata$Sub_metering_1 = clean(gdata$Sub_metering_1, as.numeric, na.exclude)
gdata$Sub_metering_2 = clean(gdata$Sub_metering_2, as.numeric, na.exclude)
gdata$Sub_metering_3 = clean(gdata$Sub_metering_3, as.numeric, na.exclude)

# tapply(medical.example$age, medical.example$treatment, mean)
# tapply(gdata$Global_reactive_power, gdata$DateTime, sum)

plot1(gdata$Global_active_power, hist, dev.copy, png, dev.off, "plot1", "Global active power", "green",20)
plot2(gdata$DateTime, gdata$Global_active_power, plot, lines, dev.copy, png, dev.off, "plot2", "Global active power x Days", "blue")

# Sub_metering_1, 2, 3
plot3(gdata,  plot, lines, legend, dev.copy, png, dev.off, "plot3", "Energy Sub Metering")

plot4(gdata,  plot, lines, legend, par, dev.copy, png, dev.off, "plot4")





## 
# gdata$Global_active_power = as.numeric(gdata$Global_active_power)
# gdata$Global_reactive_power = as.numeric(gdata$Global_reactive_power)
# gdata$Voltage = as.numeric(gdata$Voltage)
# gdata$Global_intensity = as.numeric(gdata$Global_intensity)
# gdata$Sub_metering_1 = as.numeric(gdata$Sub_metering_1)
# gdata$Sub_metering_2= as.numeric(gdata$Sub_metering_2)
# gdata$Sub_metering_3= as.integer(gdata$Sub_metering_3)

# filename = 'plot1'
# dataFrame = gdata
# title = "Global active power"
# color = "green"
# breaks = 20

# filename = paste(filename,'.png', sep = "")

# with(dataFrame, hist(Global_active_power, xlab=title, col=color, main=title,breaks=breaks))
# dev.copy(png, file=filename) ## Copy my plot to a PNG file
# dev.off() ## Don't forget to close the PNG device!
