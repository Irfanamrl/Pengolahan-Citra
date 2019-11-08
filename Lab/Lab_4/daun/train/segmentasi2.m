clc; clear all;

files = dir('train/*.jpg'); 
for k = 1:numel(files)
    rgb = imread(files(k).name);
    T = graythresh(rgb);    % find the threshold for input image
    S = im2bw(rgb,T);      % Segment the image using thresholding
    imwrite(1-S, ['train_bw2\' files(k).name]);
end