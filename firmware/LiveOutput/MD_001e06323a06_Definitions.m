
clc
close all 


addpath("../../functions/")

nodeID               = "001e06323a06";

VersionStGrimm       = "Version_RE_2019_06_12";
VersionStAirMar      = "Version_RE_AirMar2019_09_24";                 
      
% startDate  = datetime(2019,04,30);
% breakDate  = datetime(2019,07,17);
% endDate    = datetime(2019,08,16);
   
dataFolderPre   = "/home/teamlarylive/minstData"       
 
% dataFolderPre   = "/media/teamlary/Team_Lary_2/air930/mintsData"

dtSteps = [seconds(30)];  

dt      = seconds(30);
deliverablesFolder = dataFolderPre + "/deliverables"
calibratedFolder   = dataFolderPre + "/calibrated"

% startDate          = datetime(2019,06,25);
% endDate            = datetime(2019,07,10);

dataFolder         =  dataFolderPre + "/raw";

mintsDotMats       = "/home/teamlarylive/minstData/liveUpdate/dotMats" ;
liveResultsFolder  = "/home/teamlarylive/minstData/liveUpdate/results" ;
latestUpdateFolder = "/home/teamlarylive/minstData/liveUpdate/results" + "/" + nodeID;


% mintsDotMats       = "/media/teamlary/Team_Lary_2/air930/mintsData/liveUpdate/dotMats" ;
% liveResultsFolder  = "/media/teamlary/Team_Lary_2/air930/mintsData/liveUpdate/results" ;
% latestUpdateFolder = "/media/teamlary/Team_Lary_2/air930/mintsData/liveUpdate/results" + "/" + nodeID;


modelsFolderPre   =  deliverablesFolder + "/models"

pvalid            =20/100;

noptimizations    =30;

modelsFolder = modelsFolderPre +"/"+strrep(string(dt)," ","")+"/"

dataFolderPre   = "/home/teamlarylive/minstData"

% dataFolderPre   = "/media/teamlary/Team_Lary_2/air930/mintsData"

dtSteps = [seconds(30)] 



 %--------------------------------------------------------------------------
  
     nodeList={...
        nodeID ...
        };

    WantedVariablesGrimm={...
        'pm10_grimm',...
        'pm2_5_grimm',...
        'pm1_grimm',...
        'inhalable_grimm',...
        'thoracic_grimm',...
        'alveolic_grimm'...
        };

    WantedVariablesNamesGrimm={...
        'PM_{10}',...
        'PM_{2.5}',...
        'PM_{1}',...
        'Inhalable',...
        'Thoracic',...
        'Alveolic'...
        };

            WantedVariablesAirMar={...
            'airTemperature',...
            'relativeHumidity',...
            'barrometricPressureBars_YXXDRRetime',...
            'dewPoint'...
        };
    

    WantedVariablesNamesAirMar={...
            'Temperature',...
            'Humidity',...
             'Pressure',...        
            'Dew Point'...    
        };
    
    AllVariables={...
        'latitude_GPSGPRMC',...
        'longitude_GPSGPRMC',...
        'speedOverGround_GPSGPRMC',...
        'latitude_GPSGPGGA',...
        'longitude_GPSGPGGA',...
        'gpsQuality_GPSGPGGA',...
        'numberOfSatelites_GPSGGA',...
        'horizontalDilution_GPSGPGGA',...
        'altitude_GPSGPGGA',...
        'undulation_GPSGPGGA',...
        'valid_OPCN3',...
        'binCount0_OPCN3',...
        'binCount1_OPCN3',...
        'binCount2_OPCN3',...
        'binCount3_OPCN3',...
        'binCount4_OPCN3',...
        'binCount5_OPCN3',...
        'binCount6_OPCN3',...
        'binCount7_OPCN3',...
        'binCount8_OPCN3',...
        'binCount9_OPCN3',...
        'binCount10_OPCN3',...
        'binCount11_OPCN3',...
        'binCount12_OPCN3',...
        'binCount13_OPCN3',...
        'binCount14_OPCN3',...
        'binCount15_OPCN3',...
        'binCount16_OPCN3',...
        'binCount17_OPCN3',...
        'binCount18_OPCN3',...
        'binCount19_OPCN3',...
        'binCount20_OPCN3',...
        'binCount21_OPCN3',...
        'binCount22_OPCN3',...
        'binCount23_OPCN3',...
        'bin1TimeToCross_OPCN3',...
        'bin3TimeToCross_OPCN3',...
        'bin5TimeToCross_OPCN3',...
        'bin7TimeToCross_OPCN3',...
        'samplingPeriod_OPCN3',...
        'sampleFlowRate_OPCN3',...
        'temperature_OPCN3',...
        'humidity_OPCN3',...
        'pm1_OPCN3',...
        'pm2_5_OPCN3',...
        'pm10_OPCN3',...
        'rejectCountGlitch_OPCN3',...
        'rejectCountLongTOF_OPCN3',...
        'rejectCountRatio_OPCN3',...
        'rejectCountOutOfRange_OPCN3',...
        'fanRevCount_OPCN3',...
        'laserStatus_OPCN3',...
        'checkSum_OPCN3',...
        'temperature_BME280',...
        'pressure_BME280',...
        'humidity_BME280',...
        'alititude_BME280',...
        'countPerMinute_LIBRAD',...
        'radiationValue_LIBRAD',...
        'timeSpent_LIBRAD',...
        'LIBRADCount_LIBRAD',...
        'nh3_MGS001',...
        'co_MGS001',...
        'no2_MGS001',...
        'c3h8_MGS001',...
        'c4h10_MGS001',...
        'ch4_MGS001',...
        'h2_MGS001',...
        'c2h5oh_MGS001',...
        'c02_SCD30',...
        'temperature_SCD30',...
        'humidity_SCD30',...
        'luminosity_TSL2591',...
        'ir_TSL2591',...
        'full_TSL2591',...
        'visible_TSL2591',...
        'lux_TSL2591',...
        'UVLightLevel_VEML6070',...
        };

    RegressionVariables={...
        'binCount0_OPCN3',...
        'binCount1_OPCN3',...
        'binCount2_OPCN3',...
        'binCount3_OPCN3',...
        'binCount4_OPCN3',...
        'binCount5_OPCN3',...
        'binCount6_OPCN3',...
        'binCount7_OPCN3',...
        'binCount8_OPCN3',...
        'binCount9_OPCN3',...
        'binCount10_OPCN3',...
        'binCount11_OPCN3',...
        'binCount12_OPCN3',...
        'binCount13_OPCN3',...
        'binCount14_OPCN3',...
        'binCount15_OPCN3',...
        'binCount16_OPCN3',...
        'binCount17_OPCN3',...
        'binCount18_OPCN3',...
        'binCount19_OPCN3',...
        'binCount20_OPCN3',...
        'binCount21_OPCN3',...
        'binCount22_OPCN3',...
        'binCount23_OPCN3',...
        'temperature_OPCN3',...
        'humidity_OPCN3',...
        'pm1_OPCN3',...
        'pm2_5_OPCN3',...
        'pm10_OPCN3',...
        'temperature_BME280',...
        'pressure_BME280',...
        'humidity_BME280',...
        'altitude_BME280',...
        'nh3_MGS001',...
        'co_MGS001',...
        'no2_MGS001',...
        'c3h8_MGS001',...
        'c4h10_MGS001',...
        'ch4_MGS001',...
        'h2_MGS001',...
        'c2h5oh_MGS001',...
        'c02_SCD30',...
        'temperature_SCD30',...
        'humidity_SCD30',...
        'luminosity_TSL2591',...
        'ir_TSL2591',...
        'full_TSL2591',...
        'visible_TSL2591',...
        'lux_TSL2591',...
        'UVLightLevel_VEML6070',...
        };


    RegressionVariablesLabels={...
        'Bin 0',...
        'Bin 1',...
        'Bin 2',...
        'Bin 3',...
        'Bin 4',...
        'Bin 5',...
        'Bin 6',...
        'Bin 7',...
        'Bin 8',...
        'Bin 9',...
        'Bin 10',...
        'Bin 11',...
        'Bin 12',...
        'Bin 13',...
        'Bin 14',...
        'Bin 15',...
        'Bin 16',...
        'Bin 17',...
        'Bin 18',...
        'Bin 19',...
        'Bin 20',...
        'Bin 21',...
        'Bin 22',...
        'Bin 23',...
        'Temperature OPC',...
        'Humidity  OPC',...
        'PM_1',...
        'PM_{2.5}',...
        'PM_{10}',...
         'Temperature BME280',...
        'Pressure BME280',...
        'Humidity BME280',...
        'Altitude BME280',...
        'NH_3',...
        'CO',...
        'NO_2',...
        'C_3H_8',...
        'C_4H_10',...
        'CH_4',...
        'H_2',...
        'C_2H_5OH',...
        'CO_2 SCD30',...
        'Temperature SCD30',...
        'Humidity SCD30',...
        'Luminosity TSL2591',...
        'IR TSL2591',...
        'Full TSL2591',...
        'Visible TSL2591',...
        'Lux TSL2591',...
        'UV Light Level VEML6070',...
        };

    
    
wantedOut = {...
         'latitudeCoordinate_GPSGPRMC2',...
         'longitudeCoordinate_GPSGPRMC2',...
         'altitude_GPSGPGGA2',...   
          'binCount0_OPCN3',...
          'binCount1_OPCN3',...
          'binCount2_OPCN3',...
          'binCount3_OPCN3',...
          'binCount4_OPCN3',...
          'binCount5_OPCN3',...
          'binCount6_OPCN3',...
          'binCount7_OPCN3',...
          'binCount8_OPCN3',...
          'binCount9_OPCN3',...
          'binCount10_OPCN3',...
          'binCount11_OPCN3',...
          'binCount12_OPCN3',...
          'binCount13_OPCN3',...
          'binCount14_OPCN3',...
          'binCount15_OPCN3',...
          'binCount16_OPCN3',...
          'binCount17_OPCN3',...
          'binCount18_OPCN3',...
          'binCount19_OPCN3',...
          'binCount20_OPCN3',...
          'binCount21_OPCN3',...
          'binCount22_OPCN3',...
          'binCount23_OPCN3',...
          'pm1_predicted_RF',...
          'pm2_5_predicted_RF',...
          'pm10_predicted_RF',...
          'alveolic_predicted_RF',...
          'thoracic_predicted_RF',...
          'inhalable_predicted_RF',...       
             'airTemperature',...
             'relativeHumidity',...
             'barrometricPressureBars_YXXDRRetime',...
             'dewPoint'...
          };
      
      
   wantedOutLabels=  {...   
         'Latitude',...
         'Longitude',...
         'Altitude',...
         'Bin0',...
         'Bin1',...
         'Bin2',...
         'Bin3',...
         'Bin4',...
         'Bin5',...
         'Bin6',...
         'Bin7',...
         'Bin8',...
         'Bin9',...
         'Bin10',...
         'Bin11',...
         'Bin12',...
         'Bin13',...
         'Bin14',...
         'Bin15',...
         'Bin16',...
         'Bin17',...
         'Bin18',...
         'Bin19',...
         'Bin20',...
         'Bin21',...
         'Bin22',...
         'Bin23',...
         'PM1',...
         'PM2_5',...
         'PM10',...
         'Alveolic',...
         'Thoracic',...
         'Inhalable',...
         'Temperature',...
         'Humidity',...
         'Pressure',...
         'DewPoint'...  
           };      
      