clc;
clear all;
close all;

% Read the glaucoma images from DRISHTI folder
D='D:\priya\tempy\'
S = dir(fullfile(D,'*.jpg'));
i=1;
for k = 1:numel(S)
k
 F = fullfile(D,S(k).name);
 img = imread(F);
 siz=128;
 image1 =(imresize(img,[siz siz]));
%  imwrite(img, '*.jpg');
g=rgb2gray(image1);
 imwrite(g, strcat('D:\priya\tempy1',num2str(i,'%03d'),'.jpg'));
% In=0;
i=i+1;
end
