clear all

load ('edgesRatio.mat')
nbins = 50;

sigmax = std(list_edges_ratio);
mx = mean (list_edges_ratio);
binloc=(-20:100)*sigmax/10+mx;

% binloc2=(-1:10)*sigmax+mx;

figure (1)
hist(list_edges_ratio,binloc)
title('Histogram of edges ratio')
xlabel ('Edge ratio')
ylabel ('Number of triangle')

% figure (2)
% hist(list_edges_ratio,binloc2)
% title('Histogram of edges ratio')
% xlabel ('Edge ratio')
% ylabel ('Number of triangle')