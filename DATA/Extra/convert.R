# Data file downloaded from: https://archive.ics.uci.edu/ml/datasets/banknote+authentication#
# Data set description in the link

# Set current working directory to file location
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
# Check current working directory
getwd()

# Read data and specify colnames (because they are not given)
dd <- read.csv('data_banknote_authentication.txt', header = FALSE, col.names = c('Variance', 'Skewness', 'Curtosis', 'Entropy', 'Class'))
# Check there are not any missing values
any(is.na(dd))
# Check all variables are of type 'numeric'
str(dd)
# Dimensions of the data
n <- nrow(dd); p <- ncol(dd)

# Response value y
y <- dd[,p]
y <- ifelse(y == 0, -1, 1) #our ampl implementation of the SVM takes classes -1 or 1, and here we have them coded as 0 or 1
y <- data.frame(seq(1,n),y)

# Predictors: A
A <- dd[,1:p-1]
A <- data.frame(seq(1,n),A)
View(A)

# File where the data is going to be written
ampl_data_file <- 'svm_extra_data.dat'

write.table(y, file = ampl_data_file, row.names = FALSE, col.names = FALSE)
write.table(A, file = ampl_data_file, row.names = FALSE, col.names = FALSE, append = TRUE)

# Finally, we will have to introduce some extra modifications to the file manually




