function [data] = trimwav(keywords,num_files,Fs)
% trim waveform
% keywords: self explanatory
% num_files: # of recordings per word, per person ( = 50)

names = {'ch_','es_','jo_'};
shift = 0.05*Fs;
data = zeros(num_files*length(names)*length(keywords),Fs);
top_folder = 'C:\Users\eeyan\OneDrive\Documents\UMich\Research 2016';
trim_folder = 'C:\Users\eeyan\OneDrive\Documents\UMich\Research 2016\audio_trim';

counter = 1;
% get all the audio files
for i = 1 : length(keywords)
    kw = get_keyword(keywords(i));
    % get folder name 
    folder = folder_name(keywords(i));
    cd(folder);
    
    % find smallest max in audio files
    % for resizing data to match
    scale_factor = 50; % arbitrary
    for n = 1 : length(names)
        nm = get_name(names(n));
        for j = 1 : 50
            cd(top_folder);
            filename = get_filename(kw,nm,j,0);
            cd(folder);
            [y,~] = audioread(filename);
            if max(y) < scale_factor
                scale_factor = max(y);
            end
        end
        
        % scale and trim audio
        for j = 1 : num_files
            % get file
            cd(top_folder);
            filename = get_filename(kw,nm,j,0);
            % disp('untrimmed:');
            disp(filename)
            cd(folder);
            [y,~] = audioread(filename);

            % scale audio if necessary
            % m = max(y);
            %if m > scale_factor
                % disp('too loud');
                % ratio = m / scale_factor;
                % y = y ./ ratio;
            % end
            
            % use crop_beginning_time and crop_end_time
            cd(top_folder)
            trimmedword = crop_beginning_time(y,scale_factor/2);
            trimmedword = crop_end_time(trimmedword,scale_factor/2);
            
            % use 'cross' to find beginning
%             cross = scale_factor / 2;
%             start = find(y > cross,1);
%             if start - shift > 0
%                 start = floor(start - shift);
%             else
%                 start = 1;
%             end % if
            
            % trim
%             trimmedword = zeros(Fs,1);
%             if start > Fs
%                 numpoints = 2*Fs - start;
%                 trimmedword(1:numpoints) = y(start:start+numpoints-1);
%             else
%                 trimmedword = y(start:start+Fs-1);
%             end % if
%             if isempty(trimmedword)
%                 disp(i);
%                 break;
%             end % if
            
            % save to new .wav file
            % cd(top_folder);
            filename = get_filename(kw,nm,j,1);
            % disp('trimmed:');
            % disp(filename);
            cd(trim_folder);
            audiowrite(filename, trimmedword, Fs);
            data(counter,:) = trimmedword;
            counter = counter + 1;
            % go back to folder with untrimmed audio
            cd(folder);
        end % j
    end % n
end % i
cd(top_folder);

end % trimwav


function [folder] = folder_name(word)

if(strcmp(word,'watson'))
    folder = 'C:\Users\eeyan\OneDrive\Documents\UMich\Research 2016\watson';
elseif(strcmp(word,'siri'))
    folder = 'C:\Users\eeyan\OneDrive\Documents\UMich\Research 2016\siri';
elseif(strcmp(word,'okay'))
    folder = 'C:\Users\eeyan\OneDrive\Documents\UMich\Research 2016\okay';
else
    folder = 'C:\Users\eeyan\OneDrive\Documents\UMich\Research 2016\google';
end % if

end % folder_name

function keyword = get_keyword(kw)
% get keyword number to input to get_filename
    if (strcmp(kw,'watson'))
        keyword = 1;
    elseif (strcmp(kw,'siri'))
        keyword = 2;
    elseif (strcmp(kw,'okay'))
        keyword = 3;
    else
        keyword = 4;
    end % if
end % get_keyword

function name = get_name(n)
% get name number to input to get_filename
    if (strcmp(n,'ch_'))
        name = 1;
    elseif (strcmp(n,'es_'))
        name = 2;
    else
        name = 3;
    end % if 
end % get_name
