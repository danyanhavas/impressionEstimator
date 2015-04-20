# calls ui and server from github
# use this to run the tool from any computer

# need to save packages in Public for Windows
# due to IT admin issues the default libpath is invalid
# this is not ideal as it creates many folders
if(Sys.info()['sysname'] == 'Windows'){
  .libPaths("C:/Users/Public")
}

# if shiny isn't installed, install it and load it
if('shiny' %in% rownames(installed.packages()) == F){
  install.packages('shiny', dependencies=T)
}
library(shiny)

# runs the app from github
runGitHub('impressionEstimator', 'danyanhavas')