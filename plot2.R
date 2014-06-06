plot2 <- function(Date, Data, plot, lines, devcopy, png, devoff, filename, title, color) {
  
  filename = paste(filename,'.png', sep = "")

  plot(Date, Data, main=title,xlab='day-hour',ylab='Global active power (KW)', type='n')
  lines(Date, Data, col=color)
 
  devcopy(png, file=filename, width=480, height=480) ## Copy my plot to a PNG file
  devoff() ## Don't forget to close the PNG device!
  
  
}