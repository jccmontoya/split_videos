function  selectRandomFramesFromVideo(video, frames_folder, number_of_frames);

if ~exist(frames_folder,'dir')
    disp(['[split_video_in_files] Creating folder: ' frames_folder]);
    mkdir(frames_folder);
end

video_split = regexp(video,'/','split');
video_name = video_split{end};
video_name = video_name(1:end-4);

video_reader = VideoReader(video);

r = randperm(video_reader.NumberOfFrames,number_of_frames);

for i=1:length(r)
   img = read(video_reader,r(i));
   save_img = [frames_folder, video_name, 'frame_', num2str(r(i)), '.png'];
   imwrite(img,save_img);
end
