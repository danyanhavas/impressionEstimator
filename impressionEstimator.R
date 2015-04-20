# calls ui and server from github
# use this to run the tool from any computer

# if shiny isn't installed, install it
if('shiny' %in% rownames(installed.packages()) == F){
  install.packages('shiny')
}
# runs the app from github
runGitHub('impressionEstimator', 'danyanhavas')