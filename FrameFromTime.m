function seconds = FrameFromTime(time)
% This function parses time in the format hh:mm:ss into the seconds value
% and transform it in the frame ID for the shark labelling videos

time_split = strsplit(time,':');
seconds = str2num(time_split{1})*3600 + str2num(time_split{2})*60 + ... 
          str2num(time_split{3}); 
end