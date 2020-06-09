clc; 
clear; close all;
% Specify the folder where the files live.
myFolder = 'D:\Priya\TEMPY';
% Check to make sure that folder actually exists.  Warn user if it doesn't.
if ~isfolder(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  % Now do whatever you want with this file name,
  % such as reading it in as an image array with imread()
  I= imread(fullFileName);
 
% Create the Gray Level Cooccurance Matrices (GLCMs)
glcms = graycomatrix(I,'Offset',[2 0],'Symmetric',true);
% Derive Statistics from GLCM
stats = graycoprops(glcms,'Contrast Correlation Energy Homogeneity');
Contrast = stats.Contrast;
const(k,:)=Contrast;
Correlation = stats.Correlation;
corr(k,:)=Correlation;
Energy = stats.Energy;
engy(k,:)=Energy;
Homogeneity = stats.Homogeneity;
homo(k,:)=Homogeneity;
%%
% featureextraction (color)
Mean = mean2(glcms);
mean1(k,:)=Mean;
Standard_Deviation = std2(glcms);
std(k,:)=Standard_Deviation;
Entropy = entropy(glcms);
enpy(k,:)=Entropy;
RMS = mean2(rms(glcms));
rmss(k,:)=RMS;
%%
% feature variables 
Ex = [Contrast Correlation Energy Homogeneity Mean Standard_Deviation Entropy RMS];
   worksheetName = 'Results';
cellReference = sprintf('I%d', k);
  
end