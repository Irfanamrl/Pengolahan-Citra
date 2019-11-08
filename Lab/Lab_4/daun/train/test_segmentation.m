clc; clear all;

files = dir('test/*.jpg'); 
for k = 1:numel(files)
   rgb = imread(files(k).name);
   gray = rgb2gray(rgb);
   [m, n] = size(gray);
   t = 220;
        for i=1:m
            for j=1:n
                if gray(i,j) <= t
                    G(i,j)=0;
                else
                    G(i,j) = 1;
                end
            end
        end 
   imwrite(1-G, ['test_bw\' files(k).name]);
end