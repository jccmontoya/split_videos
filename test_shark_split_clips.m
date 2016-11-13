% Script to split clips into subclips from the time references contained in
% a text file with the following format:
% Date, Video_name, clip_start_time, clip_end_time
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:31:17,00:31:19
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:33:25,00:33:32

text_file_path = '/Users/jc/GoogleDrive/Sharks/2014.txt';
frame_rate = 8;

parsed_text = ReadTextFile('2014.txt');

for i=1:size(parsed_text,1)
    init_timestamp = FrameFromTime(parsed_text(3),frame_rate);
    end_timestamp  = FrameFromTime(parsed_text(4),frame_rate); 
    
end


