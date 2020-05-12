

clc
clear all
close all

display("------ MINTS ------")

addpath("../functions/")
startDate  = datetime('today','TimeZone','utc')-day(1) ;
endDate    = datetime('today','TimeZone','utc')  ;

modelsFolder = "/media/teamlary/teamlary3/air930/mintsData/modelsMats/";

period     = startDate:endDate;

dataFolder         =  "/media/teamlary/teamlary3/air930/mintsData";
rawFolder          =  dataFolder + "/raw";
rawDotMatsFolder   =  dataFolder + "/rawMats";
liveResultsFolder  =  dataFolder + "/liveUpdate/results" ;

stringIn = "mintsDailyRetimed";
stringInLive = "calibrated";


display(newline)
display("Data Folder Located @: "+ dataFolder)
display("Raw Data Located @: "+ dataFolder)
display("Raw DotMat Data Located @: "+ rawDotMatsFolder)
display("Models Located @: "+ modelsFolder)
display("Live Data Located @: "+ liveResultsFolder)
display(newline)
 
LO_0001_CreatingmasterStruct
LO_0002_mdlLoader

while true 
    
   LO_0003_getCalibratedResults
   
end