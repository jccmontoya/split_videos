% Script to split clips into subclips from the time references contained in
% a text file with the following format:
% Date, Video_name, clip_start_time, clip_end_time
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:31:17,00:31:19
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:33:25,00:33:32
%
%   IMPORTANT
% Before running the script, go to the folder containing the videos to be
% processed

clc
clearvars
close all

text_file_path = 'test2.txt'; % File with the splitting information
clip_length = 20; %20 seconds sub-clips
parsed_text = ReadTextFile(text_file_path);
start_timestamps=[];

for i=1:size(parsed_text,1)
    init_timestamp = FrameFromTime(cell2mat(parsed_text(i,3)));
    end_timestamp  = FrameFromTime(cell2mat(parsed_text(i,4))); 
    video_name = cell2mat(parsed_text(i,2));
    video_path = 'clips/'; % sub-clips are to be stored here
    
    start_timestamps = getTimestampVector(init_timestamp,end_timestamp,...
                                          clip_length);
    for j=1:length(start_timestamps)-1
        split_video_in_files(video_name, video_path,clip_length,Inf, ...
                             start_timestamps(j));
    end

     if(end_timestamp-start_timestamps(end)~=0)
         split_video_in_files(video_name, video_path,end_timestamp-start_timestamps(end),Inf, ...
                              start_timestamps(end));
     end
end

%% 
%Script to select random frames out of the clips directory created in the 
% previous script

clips_folder = 'clips/';
frames_folder = 'frames/'; % Random frames are stored here
number_of_frames = 10; % Number of random frames extracted from the sequence

clips = dir(clips_folder);

for i=1:length(clips)
    if clips(i).name(1)~='.'
        video = [clips_folder, clips(i).name];
        selectRandomFramesFromVideo(video, frames_folder, number_of_frames);
    end
end
