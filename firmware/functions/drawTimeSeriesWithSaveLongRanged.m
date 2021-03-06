function [] = drawTimeSeriesWithSaveLongRanged(dataX,dataY,nodeID,xLabel,yLabel,titleIn,startDate,endDate,longRangedFolder,stringIn,autoScaleOn,limit)

%GETMINTSDATAFILES Summary of this function goes here
%   Detailed explanation goes here
% As Is Graphs  

%     print(titleIn)
    figure_1= figure('Tag','SCATTER_PLOT',...
        'NumberTitle','off',...
        'units','pixels','OuterPosition',[0 0 900 675],...
        'Name','TimeSeries',...
        'Visible','off'...
    );

    % Create plot
    plot1 = plot(...
         dataX,...
         dataY)
     
    set(plot1,'DisplayName','Data','Marker','.',...
        'LineStyle','none');
    
       
%     yl=strcat('Mints Node ~=',string(fitresult.p1),'*Grimm Spectrometor','+',string(fitresult.p2)," (\mug/m^{3})")
    ylabel(yLabel,'FontWeight','bold','FontSize',10);

    % Create xlabel
    xlabel(xLabel,'FontWeight','bold','FontSize',10);

%     % Create title
    Top_Title=strcat(titleIn);

    Bottom_Title = strcat("Node " +string(nodeID));

%     Bottom_Title= strcat("R^2 = ", string(rSquared),...
%                         ", RMSE = ",string(rmse));

    title({" ";Top_Title;Bottom_Title},'FontWeight','bold');
%     ylim([0  limit;
    
    grid on
    if(autoScaleOn)
        ylim([0  limit]);
        
    end    

    outFigNamePre    = strcat(longRangedFolder,...
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
   
    Fig_name = strcat(outFigNamePre,'.fig')
    saveas(figure_1,char(Fig_name));



end
