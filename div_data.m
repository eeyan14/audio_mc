function [new_data] = div_data(raw_data, filt_pts, accum_pts)

% divides data into filt_pts # subsets and takes the mean of each subset
% for ONE line of data

% raw_data is ONE audio file 
% filt_pts = # divisions = 512 
% accum_pts = # pts needed per division (totally not used...)

num_samples = floor(length(raw_data) / filt_pts); % size of subset
new_data = zeros(1,filt_pts);
rawdata_start = 1;
% newdata_start = 1;

% IP = zeros(1,filt_pts);
% this loop only does one row in raw_data
for i = 1 : filt_pts
    % get subset of raw_data
    % overlap subsets
    if ~isequal(i,filt_pts)
        subset = raw_data(rawdata_start:rawdata_start+num_samples);
    else
        subset = raw_data(rawdata_start:rawdata_start+num_samples-1);
    end % if
    
    % take the mean
    new_data(1,i) = mean(subset);
    
    rawdata_start = rawdata_start + num_samples;
    % newdata_start = newdata_start + accum_pts;
end % i

% plot(new_data);
    
end % div_data

