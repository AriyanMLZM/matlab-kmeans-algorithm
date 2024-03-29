%% Declarations
close all;
clc;
clear;

objects_x = [1, 1, 2, 2, 4, 3, 5, 7, 5, 8, 10, 9];
objects_y = [1, 6, 2, 3, 4, 6, 9, 12, 10, 10, 12, 7];

clusters_x = [2, 8];
clusters_y = [10, 1];

figure
plot(objects_x, objects_y, 'ko', LineWidth=2);
hold on;
plot(clusters_x, clusters_y, 'gx', LineWidth=2.5);
xlim([-2 15]);
ylim([-2 15]);

%% Implement k-means
clc;

c1x = []; c1y = [];
c2x = []; c2y = [];
temp1 = 0;
temp2 = 0;

while(1)
    % Assignment
    for i = 1:numel(objects_x)
        dis1 = sqrt((clusters_x(1) - objects_x(i))^2 + (clusters_y(1) - objects_y(i))^2);
        dis2 = sqrt((clusters_x(2) - objects_x(i))^2 + (clusters_y(2) - objects_y(i))^2);
        if dis1 <= dis2
            c1x(numel(c1x) + 1) = objects_x(i);
            c1y(numel(c1y) + 1) = objects_y(i);
        else
            c2x(numel(c2x) + 1) = objects_x(i);
            c2y(numel(c2y) + 1) = objects_y(i);
        end
    end
    
    figure
    plot(c1x, c1y, 'bo', c2x, c2y, 'ro', LineWidth=2);
    hold on;
    plot(clusters_x, clusters_y, 'gx', LineWidth=2.5);
    xlim([-2 15]);
    ylim([-2 15]);
    
    % Update
    clusters_x(1) = sum(c1x) / numel(c1x);
    clusters_x(2) = sum(c2x) / numel(c2x);
    clusters_y(1) = sum(c1y) / numel(c1y);
    clusters_y(2) = sum(c2y) / numel(c2y);
    
    if clusters_x(1) == temp1 && clusters_x(2) == temp2
        break;
    end
    
    temp1 = clusters_x(1);
    temp2 = clusters_x(2);
    c1x = []; c1y = [];
    c2x = []; c2y = [];

end
