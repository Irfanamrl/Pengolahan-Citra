clc; clear all;

files = dir('train/*.jpg'); 
for k = 1:numel(files)
   rgb = imread(files(k).name);
   gray = rgb2gray(rgb);
   [m, n] = size(gray);
   t = 200;
        for i=1:m
            for j=1:n
                if F(i,j) <= t
                    G(i,j)=0;
                else
                    G(i,j) = 1;
                end
            end
        end 
   imwrite(G, ['train_bw\' files(k).name]);
end