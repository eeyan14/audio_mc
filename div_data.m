function [new_data] = div_data(raw_data, filt_pts, accum_pts)
% divides data into filt_pts # subsets and takes the mean of each subset
% for ONE audio file

% raw_data is ONE audio file 
% filt_pts = # divisions = 512 for now 
% accum_pts = # pts needed per division = 2^10 for now (should be 2^16?)

num_samples = floor(length(raw_data) / filt_pts);
% new_data = zeros(1,accum_pts*filt_pts); 
new_data = zeros(1,filt_pts);
rawdata_start = 1;
% newdata_start = 1;

% IP = zeros(1,filt_pts);
% this loop only does one row in raw_data
for i = 1 : filt_pts
    % get subset of raw_data
    subset = raw_data(rawdata_start:rawdata_start+num_samples-1);
    
    % use polyfit on subset?
    % y = polyfit(1:num_samples, subset, 4);
    
    % take the mean?
    % subset = mean(subset);
    
    % idk anymore

    subset = max(subset);
    
%     IP(i) = funct_IC_model(2^16-1,...
%             repmat(subset,1,accum_pts),...
%             accum_pts,...
%             false);
    
    % get more points from subset
    % new_data(1,newdata_start:newdata_start+accum_pts-1) = polyval(y,x);
    new_data(1,i) = subset;
    
    rawdata_start = rawdata_start + num_samples;
    % newdata_start = newdata_start + accum_pts;
end % i

% plot(new_data);
    
end % div_data

