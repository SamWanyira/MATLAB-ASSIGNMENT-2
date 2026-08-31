% Course Units Matrix
Course_Units=["Engineering Mathematics III",
    "Electrical Devices And Drives",
    "Computer Programing",
    "Mechanics of Materials II",
    "Fluid Mechanics II",
    "ThermoDynamics I";];
 
%Calaculating the number of CourseUnits
CUs_Number=length(Course_Units);
 
%Matrix for Marks
Marks = zeros(1, CUs_Number);
 
%Entering The Marks into The Matrix
for index = 1:CUs_Number
    Marks(index) = input(['Enter your mark for ', Course_Units{index}, ': ']);
end
 
%DisplayThe Marks
disp('Your Marks:');
disp(Marks);
 
%Grading System
Grade = zeros(1,CUs_Number);
GradingRange=[80,75,70,65,60,55,50;];
GradingSystem=[5,4.5,4,3.5,3,2.5,2,0;];
 
for index = 1:CUs_Number
    current_mark = Marks(index); 
    Grade(index) = GradingSystem(end);
    
    for g = 1:length(GradingRange)
        if current_mark >= GradingRange(g)
            Grade(index) = GradingSystem(g);
            break;                           
        end
    end
end
 
% Display results
disp('Your Grades:');
disp(Grade);
 
%update the marks array
% Credit_Units
Credit_Units=[4 3 4 4 3 4;];
 
% calculate total CUs
Total_CUs=sum(Credit_Units,"all","double");
 
GPA=(Grade*Credit_Units')/Total_CUs;
disp("Your GPA is: ")
disp(GPA)
CGPA=(Grade*Credit_Units')/Total_CUs;
disp("Your CGPA is: ")
disp(CGPA)
