%% Importing Data From an Excel Sheet.
studentData = readtable("C:\Users\Admin\OneDrive\Desktop\students.xlsx");

%Extracting The variables
names        = categorical(studentData.NAME);
tribes       = categorical(studentData.TRIBE);
hostels      = categorical(studentData.HOSTEL);
associations = categorical(studentData.ASSOCIATION);
friends      = categorical(studentData.FRIEND);

% Compute frequency vectors
Njuki=sum(studentData.HOSTEL=="NJUKI");
Jamaica=sum(studentData.HOSTEL=="JAMAICA");
nyerere=sum(studentData.HOSTEL=="NYERERE");
LOG_IN=sum(studentData.HOSTEL=="LOG IN");
Ogoola=sum(studentData.HOSTEL=="OGOOLA");
KingsAndQueens=sum(studentData.HOSTEL=="KINGS AND QUEENS");
new_harriet=sum(studentData.HOSTEL=="NEW HARRIET");

%% Graph 1
% Vertical Bar Chart 
% Student Distribution by Tribe
nexttile;
bar(tribeCounter, 'FaceColor', [0.2 0.4 0.8]);
title('Student Count by Tribe');
ylabel('Frequency');
grid on;

%% Graph 2
% Horizontal Bar Chart
% Student Distribution by Association
nexttile;
[sortedAssoc, idxA] = sort(associationCounter, 'ascend');
barh(sortedAssoc, 'FaceColor', [0.8 0.3 0.3]);
yticks(1:length(assocCategories));
yticklabels(assocCategories(idxA));
title('2. Student Count by Association');
xlabel('Frequency'); grid on;

%% Graph 3
% Standard 2D Pie Chart
% Hostel Occupancy Share
nexttile;
pie(hostelCounter, hostelCategories);
title('Hostel Occupancy Share (2D Pie)');

%% Graph 4
% 3D Pie Chart
% Association Share
nexttile;
pie3(associationCounter, assocCategories);
title('4. Association Share (3D Pie)');

%% Graph 5: Grouped Bar Chart - Tribe Distribution per Hostel
nexttile;
bar(ct_TH, 'grouped');
title('5. Tribe Distribution across Hostels');
xlabel('Tribe'); ylabel('Count');
xticks(1:length(t_labels)); xticklabels(t_labels);
legend(h_labels, 'Location', 'northeastoutside', 'FontSize', 8);
grid on;

%% Graph 6
% Stacked Bar Chart
% Association Distribution per Hostel
nexttile;
bar(ct_HA, 'stacked');
title('6. Association Breakdown per Hostel');
xlabel('Hostel'); ylabel('Count');
xticks(1:length(h_labels_2)); xticklabels(h_labels_2); xtickangle(30);
legend(a_labels, 'Location', 'northeastoutside', 'FontSize', 8);
grid on;

%% Graph 7
% Pareto Chart
% Hostel Capacity Frequency & Cumulative
nexttile;
pareto(hostelCounter, hostelCategories);
title('7. Pareto Analysis of Hostels');
xlabel('Hostel'); ylabel('Frequency'); xtickangle(30);
grid on;

%% Graph 8: Polar
% Rose Chart
% Radial Distribution of Hostels
nexttile;
angles = linspace(0, 2*pi, length(hostelCounter)+1);
polarhistogram('BinEdges', angles, 'BinCounts', hostelCounter);
title('8. Polar Distribution of Hostel Occupancy');

%% Contigency plots and multiDimensional HeatMaps
figure('Name', 'Figure 3: Heatmaps & Categorical Mappings', 'Color', 'w', 'Position', [200 200 1000 700]);
tiledlayout(2, 2, 'Padding', 'compact', 'TileSpacing', 'compact');

%% Graph 9: 
% Heatmap Matrix
% Tribe vs. Hostel
nexttile;
heatmap(h_labels, t_labels, ct_TH, ...
    'Title', '9. Heatmap: Tribe vs. Hostel', ...
    'XLabel', 'Hostel', 'YLabel', 'Tribe', ...
    'Colormap', parula);

%% Graph 10
% Heatmap Matrix
% Hostel vs. Association
nexttile;
heatmap(a_labels, h_labels_2, ct_HA, ...
    'Title', '10. Heatmap: Hostel vs. Association', ...
    'XLabel', 'Association', 'YLabel', 'Hostel', ...
    'Colormap', autumn);

%% Graph 11
% Multi-Variable Categorical Scatter Plot
nexttile([1 2]);
scatter(hostels, tribes, 90, double(associations), 'filled');
title('11. Categorical Scatter: Student Distribution (Hostel vs Tribe vs Association Color)');
xlabel('Hostel'); ylabel('Tribe'); grid on;
cb = colorbar; cb.Ticks = 1:length(a_labels); cb.TickLabels = a_labels;

%% NetworkGraphsAnd Analytics
figure('Name', 'Figure 4: Networks & Word Cloud', 'Color', 'w', 'Position', [250 250 1000 700]);
tiledlayout(2, 2, 'Padding', 'compact', 'TileSpacing', 'compact');

%% Graph 12
% Directed Friendship Social Network Digraph
nexttile;
s_names = string(studentData.NAME);
f_names = string(studentData.FRIEND);
G_friends = digraph(s_names, f_names);
p1 = plot(G_friends, 'NodeColor', [0.1 0.6 0.3], 'MarkerSize', 4, 'ArrowSize', 7);
title('12. Directed Friendship Network Graph');
axis off;