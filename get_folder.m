function [foldername] = get_folder(keyword)
% returns a folder name to cd to in mclearner.m
% keyword is an int
% keywords: 1) watson
%           2) siri
%           3) okay
%           4) google
% don't think i need this anymore

    if isequal(1,keyword)
        foldername = ['C:\Users\Esther\OneDrive\Documents\UMich\'...
            'Research 2016\watson\watson_trim'];
    elseif isequal(2,keyword)
        foldername = ['C:\Users\Esther\OneDrive\Documents\UMich\',...
            'Research 2016\siri\siri_trim'];
    elseif isequal(3,keyword)
        foldername = ['C:\Users\Esther\OneDrive\Documents\UMich\',...
            'Research 2016\okay\okay_trim'];
    elseif isequal(4,keyword)
        foldername = ['C:\Users\Esther\OneDrive\Documents\UMich\',...
            'Research 2016\google\google_trim'];
    end

end

