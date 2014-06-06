clean <- function(data, as.numeric, na.exclude) {

  as.numeric(sub(",", ".",na.exclude(data), fixed = TRUE))
  
}