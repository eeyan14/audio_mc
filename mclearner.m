% top file

% LPC, isolated word recognition

% clear all
% close all

keyword = {'google','okay','siri','watson'};
% names = {'ch_','es_'};
% top folder
% top_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016';
% folder with audio
% audio_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016\audio_trim';
top_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc';
audio_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc\audio_trim';

% classifier = 'keyword';
% sec = 0.4;
% n_divide = 1;
% acc = zeros(n_divide,length(keyword));
% for filt_pts = 512 : 512 %1 : n_divide;
%     [acc(filt_pts,:),train_data] = run_tests_2(keyword,filt_pts,sec,top_folder,audio_folder);
% end
% 
% plot data
gdata = train_data(1:80,:);
odata = train_data(81:160,:);
sdata = train_data(161:240,:);
wdata = train_data(241:320,:);

% figure
% boxplot(gdata);
% title('google');
% figure
% boxplot(odata);
% title('okay');
% figure
% boxplot(sdata);
% title('siri');
% figure
% boxplot(wdata);
% title('watson');

figure
hold on
plot(mean(gdata));
plot(mean(odata));
plot(mean(sdata));
plot(mean(wdata));
title('mean (80 recordings per word)');
legend('google','okay','siri','watson');

cd(top_folder);



