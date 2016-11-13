function cell_parsed_text = ReadTextFile(file_path)
% This function reads an imput text file containing the clipping
% information in comma separated values following this format:
% Date, Video_name, clip_start_time, clip_end_time
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:31:17,00:31:19

fileID = fopen(file_path);
file_data = textscan(fileID,'%s %s %s %s','Delimiter',',');
a=vertcat(file_data(:))';
b = a{1};
c = a{2};
d = a{3};
e = a{4};

cell_parsed_text = [b,c,d,e];

fclose(fileID);
end
