
% Read Robot Data:
% [A, B] = textread('H5_robot.txt', '%s %s');

function C = robot

fileID = fopen('H5_robot.txt');
C = textscan(fileID, '%f %f', 'Delimiter',',','EmptyValue', -Inf);
fclose(fileID);


%% Visualization:
%{
axis on; grid on;
axis equal;
plot(C{1}, C{2}, 'bo');
hold on;
plot(C{1}, C{2}, 'b*');
plot(C{1}, C{2}, 'b+');
% plot(C{1}, C{2}, 'b');
rectangle('Position', [-1 -0.5 2 1]);
%}

end


%{
for i = 1:size(37)
    plot(A(i), B(i), 'r.');
end
%}