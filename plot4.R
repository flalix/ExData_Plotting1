plot4 <- function(Data, plot, lines,legend, par, devcopy, png, devoff, filename) {
  
  par(mfrow = c(2, 2))
  filename = paste(filename,'.png', sep = "")
  
  x <- 'Global Active Power'
  plot(Data$DateTime, Data$Global_active_power, main=x,xlab='daytime',ylab=x, type='n')
  lines(Data$DateTime, Data$Global_active_power, col="black")

  plot(Data$DateTime, Data$Voltage, main='Voltage variation',xlab='daytime',ylab='Voltage (V)', type='n')
  lines(Data$DateTime, Data$Voltage, col="black")
  
  x="Sub Metering"
  plot(Data$DateTime, Data$Sub_metering_1, main=x,xlab='daytime',ylab=x, type='n')
  lines(Data$DateTime, Data$Sub_metering_1, col="black")
  lines(Data$DateTime, Data$Sub_metering_2, col="red")
  lines(Data$DateTime, Data$Sub_metering_3, col="blue")
  
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         bty = "n",lwd=2, cex=1.2, x.intersp=.8, y.intersp=.3, col=c("black","red","blue"), lty=c(1,1,1))
  
  plot(Data$DateTime, Data$Global_reactive_power, main="Global Reactive Power Variation",xlab='daytime',ylab='Global Reactive Power', type='n')
  lines(Data$DateTime, Data$Global_reactive_power, col="black")
  
  
  devcopy(png, file=filename, width=480, height=480) ## Copy my plot to a PNG file
  devoff() ## Don't forget to close the PNG device!
  
  
}

