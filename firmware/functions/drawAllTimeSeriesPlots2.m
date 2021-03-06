function [] = drawAllTimeSeriesPlots2(calibrated,nodeID,givenDate,calibratedFolder,timeZone)
%DRAWALLTIMESERIESPLOTS Summary of this function goes here
%   Detailed explanation goes here
latitudeStringPre = sprintf('%0.8f',calibrated.Latitude(1));
longitudeStringPre =sprintf('%0.8f',calibrated.Longitude(1));
latitudeString = strcat(latitudeStringPre,"^o");
longitudeString =strcat(longitudeStringPre,"^o");


    drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.PM1,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "PM_{1}(\mug/m^{3})",...
                    strcat("PM_{1}(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("PM1_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )
                
    drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.PM2_5,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "PM_{2.5}(\mug/m^{3})",...
                    strcat("PM_{2.5}(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("PM2_5_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )
    
    drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.PM4,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "PM_{4}(\mug/m^{3})",...
                    strcat("PM_{4}(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("PM4_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )
                            
        drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.PM10,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "PM_{10}(\mug/m^{3})",...
                    strcat("PM_{10}(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("PM10_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )

        drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.PMTotal,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "PM_{Total}(\mug/m^{3})",...
                    strcat("PM_{Total}(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("PMTotal_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )                
         drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.dCn,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "dCn",...
                    strcat("dCn(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("dCn_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    ) 
                   
         drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.Temperature,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "Temperature",...
                    strcat("Temperature(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("Temperature_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    ) 
          
         drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.Humidity,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "Humidity",...
                    strcat("Humidity(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("Humidity_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )                 
          
         drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.Pressure,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "Pressure",...
                    strcat("Pressure(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("Pressure_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )           
                
                  
         drawTimeSeriesWithSave2(...
                    calibrated.dateTime,...
                    calibrated.DewPoint,...
                    nodeID,...
                    strcat(timeZone," Time"),...
                    "Dew Point",...
                    strcat("Dew Point(",latitudeString,",",longitudeString,")"),...
                    givenDate,...
                    calibratedFolder,...
                    strcat("DewPoint_",timeZone,"_Time"),...
                    false,...
                    100 ...
                    )             
                
end

