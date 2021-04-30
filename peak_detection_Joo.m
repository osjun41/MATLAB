%% load data
clc
clear
close all

[abf_raw, fname_list] = abfload_JM();

for d = 1:size(abf_raw,2)
    data.raw = abf_raw(:,d,:);
    
    %sampling rate
    samplerate=10000;
    t = 1/samplerate:1/samplerate:size(data.raw,1)/samplerate;
    
    %baseline
    blstart = 100*(samplerate/1000);
    blend = 300*(samplerate/1000);
    bl= abf_raw(blstart:blend,d,:);
    blmean = mean(bl);
    
    %stimulus start
    stimstart = 300*(samplerate/1000);
    stimend = 300.1*(samplerate/1000);
    
    %%baseline normalization
    data.blnorm = (data.raw - blmean);
    
    %%average
    data.avg = mean(data.blnorm,3);
    avgFig = figure(d);
    hold on
    for ii = 1:size(data.avg,3)
        plot(t,data.avg(:,1,ii))
    end
    title('avg')
    xlabel('time (s)')
    ylabel('current (pA)')
    xlim([0.25 0.45])
    
    
    %%find peak, onset latency
    %peak
    %from stimstart to +100 ms
    data.peakval = abs(data.avg(stimstart:stimend+100*(samplerate/1000)));
    [data.pkAmp,pkloc] = findpeaks(data.peakval(:,1,ii),'SortStr','descend','NPeaks',1);
    
    %onset latency
    %from stimstart to +20 ms
    lats = findchangepts(data.avg((stimstart:stimend+20*(samplerate/1000))),'Statistic','mean','MaxNumChanges',8);
    lat1 = lats(1,:);
    
    %convert to ms
    data.pkLoc = pkloc*(1000/samplerate);
    data.onLat = lat1*(1000/samplerate);
    
    %store values
    peakAmp(d,:) = data.pkAmp;
    peakLoc(d,:) = data.pkLoc;
    onsetLat(d,:) = data.onLat;
    result = [peakAmp,peakLoc,onsetLat];
    data.cut(d,:) = data.avg((stimstart-10*(samplerate/1000)):stimend+150*(samplerate/1000))';
    data.cut2(d,:) = data.avg((stimstart-10*(samplerate/1000)):stimstart)';
    data.cut3(d,:) = data.avg((stimstart-10*(samplerate/1000)):stimend)';
    
    %saveas(figure(d),'tif');
end
%% export data to excel

filename = '20210326 Peak detection alalysis_0mV_mean8.xlsx';
colname = {"abf filenames","peak amplitude (pA)","peak location (ms)","onset latency (ms)"};
writematrix(fname_list',filename,'Range','A2');
writecell(colname,filename,'Range','A1');
writematrix(result,filename,'Range','B2');

writematrix(fname_list',filename,'Sheet',2,'Range','A1');writematrix(data.cut,filename,'Sheet',2,'Range','B1');

%% raw data fig
%     rawFig = figure(d);
%     subplot(2,1,1)
%     hold on
%     for ii = 1:size(data.raw,3)
%         plot(t,data.raw(:,1,ii))
%     end
%     title('raw')
%     xlabel('time (s)')
%     ylabel('current (pA)')
%     xlim([0 0.6])
%     setAx(gca);
%
%     %blnorm fig
%     blnorm = figure(d);
%     subplot(2,1,2)
%     hold on
%     for ii = 1:size(data.blnorm,3)
%         plot(t,data.blnorm(:,1,ii))
%     end
%     title('blnorm')
%     xlabel('time (s)')
%     ylabel('current (pA)')
%     xlim([0 0.6])
%     setAx(gca);
