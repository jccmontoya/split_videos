% Script to split clips into subclips from the time references contained in
% a text file with the following format:
% Date, Video_name, clip_start_time, clip_end_time
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:31:17,00:31:19
% 01/28/14,clip-2014-01-28 08;10;59.mov,00:33:25,00:33:32

clc
clear all
close all
text_file_path = '/Users/jc/GoogleDrive/Sharks/test.txt';
clip_length = 3; %20 seconds sub clips
parsed_text = ReadTextFile(text_file_path);
start_timestamps=[];

for i=1:size(parsed_text,1)
    init_timestamp = FrameFromTime(cell2mat(parsed_text(i,3)));
    end_timestamp  = FrameFromTime(cell2mat(parsed_text(i,4))); 
    video_name = cell2mat(parsed_text(i,2));
    video_path = 'clips/'; %cell2mat(parsed_text(i,1));
    
    start_timestamps = getTimestampVector(init_timestamp,end_timestamp,...
                                          clip_length);
    for j=1:length(start_timestamps)-1
        %video_lenght = start_timestamps(j+1) - start_timestamps(j);
        %disp([clip_length , video_name , video_path , start_timestamp(j)]);
        %out_video_name = [video_name(1:end-4) , '_Frames(',  num2str(start_timestamps(j)),...
        %                 '-' , num2str(start_timestamps(j)+clip_length), ')',...
        %                 video_name(end-3:end)]
        split_video_in_files(video_name, video_path,clip_length,Inf, ...
                             start_timestamps(j));
    end

    
    end_timestamp 
    video_name 
    video_path 
    start_timestamps(end)
    %out_video_name = [video_name(1:end-4) , '_Frames(',  num2str(start_timestamps(end)), ..
    
     %                '-' , num2str(end_timestamp), ')', video_name(end-3:end)]
     
     if(end_timestamp-start_timestamps(end)~=0)
         split_video_in_files(video_name, video_path,end_timestamp-start_timestamps(end),Inf, ...
                              start_timestamps(end));
     end
end

%% 
%Script to select random frames out of the clips directory created in the 
% previous script

clips_folder = 'clips/';
frames_folder = 'frames/';
number_of_frames = 10;

clips = dir(clips_folder);

for i=1:length(clips)
    if clips(i).name(1)~='.'
        video = [clips_folder, clips(i).name];
        selectRandomFramesFromVideo(video, frames_folder, number_of_frames);
    end
end
