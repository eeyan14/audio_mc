function [data_arr, classes_arr, other_class] = get_set(keywords, names, num_record_start, num_record_end, ...
                                           points, category, top_folder, audio_folder)
% keywords is an array of keywords to train with
% names is an array of names to train with
% num_record_start is the start # of the file
% num_record_start is the end # of the file
% for categorizing by name, just pass in all the keywords

num_keyword = length(keywords);
num_people = length(names);
num_record = num_record_end - num_record_start;

% top_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016';
% audio_folder = 'C:\Users\Esther\OneDrive\Documents\UMich\Research 2016\audio_trim';

data_arr = zeros(num_keyword*num_people*num_record,points);
classes_arr = cell(num_keyword*num_people*num_record,1);
other_class = cell(num_keyword*num_people*num_record,1);
counter = 1;

for k = 1 : num_keyword
    for p = 1 : num_people
        for r = num_record_start : num_record_end
            kw = get_keyword(keywords(k));
            n = get_name(names(p));
            cd(top_folder);
            filename = get_filename(kw,n,r,1);
            disp(filename);
            cd(audio_folder);
            [data,~] = audioread(filename);
            data = data';
            % whos data data_arr
            data_arr(counter,:) = data(1:points);
            if strcmp(category,'keyword')
                classes_arr(counter,1) = keywords(k);
                other_class(counter,1) = names(p);
            else
                classes_arr(counter,1) = names(p);
                other_class(counter,1) = keywords(k);
            end
            counter = counter + 1;
        end % r
    end % p
end % k
cd(top_folder);
end % train_set

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
    else
        name = 2;
    end % if 
end % get_name