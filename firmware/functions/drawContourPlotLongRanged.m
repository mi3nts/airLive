function [] = drawContourPlotLongRanged(calibrated,nodeID,xLabel,yLabel,titleIn,startDate,endDate,calibratedFolder,stringIn)
% (dataX,dataY,nodeID,xLabel,yLabel,titleIn,givenDate,calibratedFolder,stringIn,autoScaleOn,limit)
%DRAWCONTOURPLOT Summary of this function goes here
%   Detailed explanation goes here
    
figure_1= figure('Tag','Contour_Plot',...
        'NumberTitle','off',...
        'units','pixels','OuterPosition',[0 0 900 675],...
        'Name','TimeSeries',...
        'Visible','off'...
    );

contourOut = {...
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
          }

      binBoundriesHigh = [.46,.66,1,1.3,1.7,2.3,3.0,4.0,5.2,6.5,8,10,12,14,16,18,20,22,25,28,31,34,37,40];
      binBoundriesLow  = [0.35,.46,.66,1,1.3,1.7,2.3,3.0,4.0,5.2,6.5,8,10,12,14,16,18,20,22,25,28,31,34,37];
      binCentersPre        = (binBoundriesHigh+binBoundriesLow)./2;
      
      
      latitudeStringPre = sprintf('%0.8f',calibrated.latitude_GPSGPGGA(1));
      longitudeStringPre =sprintf('%0.8f',calibrated.longitude_GPSGPGGA(1));
      latitudeString = strcat(latitudeStringPre,"^o");
      longitudeString =strcat(longitudeStringPre,"^o");
    
      
      for n =1:length(binBoundriesHigh)
          binCenters(n) = string(sprintf('%0.2f',binCentersPre(1,n)));
      end 
      
      
      timeIn = days(calibrated.dateTime - startDate);
      calibratedTable = timetable2table(calibrated);
      calibratedArray = log10(table2array(calibratedTable(:,contourOut))+1);

      contourf(timeIn,[1:24],calibratedArray',50,'LineStyle', 'None');
%       xticks([0:4:24]);
      yticks([1:1:24]);
      yticklabels(string(binCenters));
      ylabel(yLabel,'FontWeight','bold','FontSize',10);
      xlabel(xLabel,'FontWeight','bold','FontSize',10);
      Top_Title=strcat(strcat(titleIn,"(",latitudeString,",",longitudeString,")"));
      Bottom_Title = strcat("Node " +string(nodeID));
      title({" ";Top_Title;Bottom_Title},'FontWeight','bold');

           
      colormap(jet) ;map2 = colormap; map2(1,:) = 1; colormap(map2);
      c = colorbar;
      c.Label.String = 'log_{10}(Particle Counts)';

    outFigNamePre    = strcat(calibratedFolder,...
                                                    "MINTS_",...
                                                     nodeID,...
                                                     "_",stringIn,"_",...
                                                     num2str(year(startDate),'%02d'),"_",...
                                                     num2str(month(startDate),'%02d'),"_",...
                                                     num2str(day(startDate),'%02d'),...
                                                     "_to_", ...                   
                                                     num2str(year(endDate),'%02d'),"_",...
                                                     num2str(month(endDate),'%02d'),"_",...
                                                     num2str(day(endDate),'%02d')...
                                                 );   
                                                 
    mkdir(fileparts(outFigNamePre));
    Fig_name = strcat(outFigNamePre,'.png')
    saveas(figure_1,char(Fig_name));
   
%     Fig_name = strcat(outFigNamePre,'.fig')
%     saveas(figure_1,char(Fig_name));
%       
    
    
end

