# gives the information ( documentation of the function)
?str


getwd()

setwd('F:/R programming')

getwd()



stateInfo <- read.csv('F:/R programming/learning/data_analysis/material/stateData.csv')



# getting data where regino value is 1
View(stateInfo[stateInfo$state.region == 1, ])



edit(stateInfo)





# reading binary data from a BMP file 

image.file <- "C:/Users/HP/Downloads/man.png"


myimage.info <- file.info(image.file)


myimage.info
myimage.data <- readBin(image.file, 
                        n = as.numeric(myimage.info['size']),
                        what = 'raw'
                        )


myimage.data

