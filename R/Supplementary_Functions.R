###########################################################################
###Heatmap function###
###########################################################################
# Input: a column in data
# Output: returns a heatmap with x-axis as week number and y-axis as day of week
Heatmap_function <- function(variable_vector, plot_title){
  #keep nrow as multiple of 7
  mod7= length(variable_vector)%%7
  end=length(variable_vector)-mod7
  #Convert dataframe into matrix
  heatmap_dat=matrix(variable_vector[0:end], nrow=7)
  #Set row names as Day of Week
  row.names(heatmap_dat) = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
  heatmap_dat <- heatmap_dat[nrow(heatmap_dat):1, ]
  #Convert zeros to NAs
  heatmap_dat[heatmap_dat == 0] <- NA
  #Draw heatmap
  my_palette <- colorRampPalette(c("light blue", "dark blue"))(n = 299)
  heatmap(heatmap_dat, Rowv=NA, Colv=NA, col=my_palette, main=plot_title)
}

###########################################################################
###Fucntion--Percent of Ourliters###
###########################################################################
# Input: a column in data
# Output: returns the percentage of statistically calculated (outside of 1.5*IQR) outliers

outliers_percent <- function(x){
  qnt <- quantile(x, probs=c(.25, .75), na.rm = T)
  H <- 1.5 * IQR(x, na.rm = T)
  length(which(x < (qnt[1] - H)| x > (qnt[2] + H))) / length(x)
}
