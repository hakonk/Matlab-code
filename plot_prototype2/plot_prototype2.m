% This script creates the plot of the author's interaction with 
% prototype 2 as shown in Chapter 3
% Licensed under GNU GPL 3

% Importing recorded marker position data:
tactAmx = importdata('markerX'); tactAmy = importdata('markerY');
tactAmz = importdata('markerZ'); tactAmvel = importdata('markerYVel');
% creating a time representation vector
tRange = (0:length(tactAmx)-1)./length(tactAmx)*20;

% Audio and the tactile signals are imported using
% the built in function provided by the mirtoolbox:
tactAm = miraudio('drumtact.aiff','Normal'); 
audAm = miraudio('drumaud.aiff','Normal');

% Computing spectrograms
sTactAm = mirgetdata(mirspectrum(tactAm,'Frame',4096/44100,.5,'Max',400,'Length',16000));
sAudAm = mirgetdata(mirspectrum(audAm,'Frame',4096/44100,.5,'Max',1500,'Length',16000));

% creating figure and enabling greyscale
hFig = figure(1); a = gray(100); a = 1-a; colormap(a);
set(hFig, 'Position', [1.0 1.0 1243.0 650.0]); 

% Plotting:
subplot(3,1,1);
subtightplot(3,1,1,0);
imagesc(tRange,0:400,sTactAm); axis xy;
aa1 = [0:100:400]; aa2 = aa1*(147/400)+0.5;
title('Spectrogram of vibrotactile signal (top), audio signal (middle) and marker x,y,z position (lower)','FontSize',16);
set(gca,'XLim',[7 20]);
set(gca,'XTick',[7:20]);
set(gca,'XTickLabel',[]);
ylabel('Frequency (Hz)','FontSize',16);
ylhand = get(gca,'ylabel');
set(ylhand,'FontSize',16);
set(gca,'YTickLabel',aa1,'FontSize',14);

subplot(3,1,2); 
subtightplot(3,1,2,0);
bb1 = [0:250:1250];
imagesc(tRange,0:1500,sAudAm); axis xy;
set(gca,'XLim',[7 20]);
set(gca,'XTick',[7:20]);
set(gca,'XTickLabel',[]);
set(gca,'YTick',bb1);
set(gca,'YTickLabel',bb1,'FontSize',14);
ylabel('Frequency (Hz)','FontSize',16);
ylhand = get(gca,'ylabel');
set(ylhand,'FontSize',16);

subtightplot(3,1,3,0);
plot(tRange,tactAmx,'k-',tRange,tactAmy,'k--',tRange,tactAmz,'k:');
set(gca,'XLim',[7 20]);
set(gca,'XTick',[7:20]);
set(gca,'XTickLabel',[0:13]);
set(gca,'YLim',[-1500 2200]);
set(gca,'YTick',[-1500:500:2000]);
set(gca,'YTickLabel',[-1500:500:2000],'FontSize',14);
xlabel('Time (s)','FontSize',16);
xlabh = get(gca,'XLabel');
set(xlabh,'Position',get(xlabh,'Position') + [0 200. 0]);
ylabel('Marker pos (mm)','FontSize',16);
h_legend = legend('x-pos','y-pos','z-pos');
set(h_legend, 'Location','NorthWest','FontSize',16);

