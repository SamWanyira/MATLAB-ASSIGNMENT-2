Myprogram=readtable('C:\Users\ADMIN\OneDrive\Desktop\BEM.xlsx')

save('Myprogram.mat','Myprogram')
writetable(Myprogram,'C:\Users\ADMIN\OneDrive\Desktop\MATLAB Programmming\Myprogram.xlsx')
writetable(Myprogram,'C:\Users\ADMIN\OneDrive\Desktop\BEM GROUP -0NE.xlsx','sheet','sheeet1')


histogram(categorical(string(Myprogram.TRIBE)))
title('students by Tribe')
xlabel('Tribe')
ylabel('Number of students')
saveas(gcf,'tribe plot.png')


histogram(categorical(string(Myprogram.HOSTEL)))
title('Students by Hostel')
xlabel('Hostel')
ylabel('Number of students')
saveas(gcf,'hostel plot.png')

histogram(categorical(string(Myprogram.ASSOCIATION)))
title('Student by Association')
xlabel('Association')
ylabel('Number of students')
saveas(gcf,'Association plot.png')
 
histogram(categorical(string(Myprogram.FRIEND)))
title('Stdents by Friend')
xlabel('Friend')
ylabel('Number of students')
saveas(gcf,'friend plot.png')
