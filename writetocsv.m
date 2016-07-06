function [] = writetocsv(data, class, filename)
% file is in the format:
% class1  data11  data12  data13 ...
% class2  data21  data22  data23 ...
% class3  data31  data32  data33 ...
% class4  data41  data42  data43 ...
% ...     ...     ...     ...

filt_pts = 512;
cell_arr = cell(length(class),filt_pts+1);
for i = 1 : length(data(:,1))
    cell_arr(i,1) = class(i);
    cell_arr(i,2:end) = num2cell(div_data(data(i,:),filt_pts,2^10));
end
cell_arr = cell_arr';

% data_mean = data_mean';
% class = class';

f = fopen(filename,'w');
for i = 1 : length(data(:,1))
    fprintf(f,'%s,',cell_arr{:,i});
    fprintf(f,'\n');
end
fclose(f);

end