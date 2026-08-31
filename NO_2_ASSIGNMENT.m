clc;
clear;

disp('STUDENT GPA AND CGPA CALCULATOR');
disp('--------------------------------');

% Number of courses
n = input('Enter number of courses this semester: ');

% Initialize variables
totalCU = 0;
totalPoints = 0;

% Store course information
Course = strings(n,1);
Mark = zeros(n,1);
CU = zeros(n,1);
GP = zeros(n,1);

% Loop through courses
for i = 1:n
    
    fprintf('\nCOURSE %d\n', i);
    
    Course(i) = input('Enter course name: ','s');
    Mark(i) = input('Enter mark: ');
    CU(i) = input('Enter credit units: ');
    
    % Determine Grade Point
    if Mark(i) >= 80
        GP(i) = 5.0;
    elseif Mark(i) >= 75
        GP(i) = 4.5;
    elseif Mark(i) >= 70
        GP(i) = 4.0;
    elseif Mark(i) >= 65
        GP(i) = 3.5;
    elseif Mark(i) >= 60
        GP(i) = 3.0;
    elseif Mark(i) >= 55
        GP(i) = 2.5;
    elseif Mark(i) >= 50
        GP(i) = 2.0;
    else
        GP(i) = 0;
    end
    
    % Calculate weighted points
    totalPoints = totalPoints + GP(i) * CU(i);
    totalCU = totalCU + CU(i);
    
end

% Calculate GPA
GPA = totalPoints / totalCU;

% Display results in a table
Results = table(Course, Mark, CU, GP);

disp(' ');
disp('SEMESTER RESULTS');
disp(Results);

fprintf('\nTotal Credit Units = %.0f\n', totalCU);
fprintf('Semester GPA = %.2f\n', GPA);

% CGPA section
disp(' ');
disp('CGPA CALCULATION');

previousCGPA = input('Enter previous CGPA: ');
previousCU = input('Enter total previous Credit Units: ');

CGPA = ((previousCGPA * previousCU) + ...
        (GPA * totalCU)) / (previousCU + totalCU);

fprintf('\n================================\n');
fprintf('FINAL RESULTS\n');
fprintf('GPA  = %.2f\n', GPA);
fprintf('CGPA = %.2f\n', CGPA);
fprintf('================================\n');
