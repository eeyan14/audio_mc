function [] = plotwav(data, keywords, num_people, num_record, top_folder, audio_folder)
% plots data onto num_keyword different figures (aka if num_keyword == 4, 
% there will be 4 figures)
% each figure has num_record*num_people different subplots


% top_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016';
% audio_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016\audio_trim';
keyword = {'watson','siri','okay','google'};

% open .wav files and plot
cd(audio_folder);

global_counter = 1;
keyword_counter = 1;
num_keyword = length(keywords);
for k = 1 : num_keyword
    figure
    title(keyword(k));
    for p = 1 : num_people
        for r = 1 : num_record
            disp(keyword_counter);
            subplot(10,10,keyword_counter);
            plot(data(global_counter,:));
            title(keyword_counter);
            global_counter = global_counter + 1;
            keyword_counter = keyword_counter + 1;
        end % r
    end % p
    keyword_counter = 1;
end % k

cd(top_folder);

end