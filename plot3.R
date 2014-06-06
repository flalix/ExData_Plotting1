plot3 <- function(Data, plot, lines,legend, devcopy, png, devoff, filename, title) {
  
  filename = paste(filename,'.png', sep = "")
  
  plot(Data$DateTime, Data$Sub_metering_1, main=title,xlab='day-hour',ylab=title, type='n')
  lines(Data$DateTime, Data$Sub_metering_1, col="black")
  lines(Data$DateTime, Data$Sub_metering_2, col="red")
  lines(Data$DateTime, Data$Sub_metering_3, col="blue")
  
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         bty = "n",lwd=2, cex=1.2,y.intersp=1.4, col=c("black","red","blue"), lty=c(1,1,1))
  
  devcopy(png, file=filename, width=480, height=480) ## Copy my plot to a PNG file
  devoff() ## Don't forget to close the PNG device!
  
  
}