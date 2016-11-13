% Script to split clips into subclips from the time references contained in
% a text file with the following format:
% Date, Video_name, clip_start_time, clip_end_time
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:31:17,00:31:19
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:33:25,00:33:32

text_file_path = '/Users/jc/GoogleDrive/Sharks/test.txt';

parsed_text = ReadTextFile(text_file_path);

for i=1:size(parsed_text,1)
    init_timestamp = FrameFromTime(cell2mat(parsed_text(i,3)));
    end_timestamp  = FrameFromTime(cell2mat(parsed_text(i,4))); 
    video_lenght = end_timestamp - init_timestamp;
    video_name = cell2mat(parsed_text(i,2));
    video_path = cell2mat(parsed_text(i,1));
    split_video_in_files(video_name,video_path,video_lenght,Inf,init_timestamp);
    
end


