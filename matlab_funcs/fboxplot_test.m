clc;
clear;
 y = cat(3, randn(100,21), 0.25+randn(100,21));
        x = 0:20;
     
        D= randn(100,21);
%        figure

iosr.statistics.functionalBoxPlot(x, D)%, 'inner_u', 'main');
        
        
        % Draw a functional box plot for the first function
%        figure
 %       iosr.statistics.functionalBoxPlot(x, y(:,:,1), );
  %      title('Functional boxplot.')
   %     axis tight
    %    box on
     %   figure
      %  iosr.statistics.functionalBoxPlot(x, y(:,:,2));
       % title('Functional boxplot.')
        %axis tight
        %box on
