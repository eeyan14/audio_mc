% top file

% LPC, isolated word recognition

clear all
% close all

keyword = {'google','okay','siri','watson'};
% names = {'ch_','es_'};
% top folder
% top_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016';
% folder with audio
% audio_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016\audio_trim';
top_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc';
audio_folder = '\\engin-labs.m.storage.umich.edu\eeyan\windat.V2\Documents\audio_mc\audio_trim';

classifier = 'keyword';
sec = 0.4;
n_divide = 1;
acc = zeros(n_divide,length(keyword));
for filt_pts = 512 : 512 %1 : n_divide;
    acc(filt_pts,:) = run_tests_2(keyword,filt_pts,sec,top_folder,audio_folder);
end

cd(top_folder);



