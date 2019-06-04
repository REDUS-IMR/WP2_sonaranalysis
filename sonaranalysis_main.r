# This script is the master script for analysing the sonar data for the sonar taskin REDUS WP2

# Libraries
library(Rstox)

# sonar analysis script
D <- '//ces.imr.no/mea/2017_14809_REDUS/cruise_data'

# Test parse data
nz <- list.files(D)

for (i in nz){
  D2<-file.path(D,i)
  su <- list.files(D2)
  for (j in su){
    D3 <- file.path(D2,j,'ACOUSTIC')
    # check for EK60 files
    
    
    # Check for SU90 files
    SU90 <- file.path(D3,"POSTPROCESSING","PYSONAR","SU90","REPORT")
    ex <- F
    if (dir.exists(SU90)) {
      ex <- file.exists(file.path(SU90,"ListUserFile20_SU90_vertical.xml"))
    }
    if (ex) {
      print(c(j,"SU90","OK"))
    }
    else (print(c(j,"SU90","No report")))
    
    # Check for MS70 files
    
    # Check for EK60 files
    EK60 <- file.path(D3,"LSSS","REPORTS")
    ex <- F
    if (dir.exists(EK60)) {
      files=dir('.','*.xml')
      if (length(files)==0){
        print(c(j,"Echosounder","No report"))
      } else if (length(files)>1){
        print(c(j,"Echosounder","Multiple reports"))
      } else {
        print(c(j,"Echosounder","OK"))
      }
        
    }
  }
}

 
# Create StoX projects


