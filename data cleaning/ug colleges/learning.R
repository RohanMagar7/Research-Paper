expanded_path <- path.expand('-')

expanded_path


demo()

demo(graphics)



# getting working directory
wkdir <- getwd()



# setting working directory
#setwd('F:/R programming/data cleaning/ug colleges')


getwd()


dir()

dir(pattern = '.txt')       

dir(pattern = '.R')   

file.exists('bamudb.R')

newdirPath <- 'createdbycode'

if ( file.exists(wkdir)) dir.create(newdirPath)

dir(pattern = 'create')

# creating a file
file.create('learning.R')
