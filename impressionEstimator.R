.libPaths("C:\Users\danyan.Li\Documents\R")
# calls ui and server from github
# use this to run the tool from any computer

# if shiny isn't installed, install it and load it
if('shiny' %in% rownames(installed.packages()) == F){
  install.packages('shiny', dependencies=T)
}
library(shiny)
# runs the app from github
runGitHub('impressionEstimator', 'danyanhavas')