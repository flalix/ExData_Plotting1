plot1 <- function(data, hist, devcopy, png, devoff, filename, title, color, breaks) {

  filename = paste(filename,'.png', sep = "")
  
  # with(data, hist(field, xlab=title, col=color, main=title,breaks=breaks))

  hist(data, xlab=title, col=color, main=title,breaks=breaks)
  devcopy(png, file=filename, width=480, height=480) ## Copy my plot to a PNG file
  devoff() ## Don't forget to close the PNG device!
  
  
}