%% 661: H5: RRT Implementation (Chahat Deep Singh)
% Date: April 21 2017


%{
Problem 1:

start (x,y,theta):  [80,60,pi]
goal region (x,y,radius) = [0, 0, 20]
epsilon = 5

---------------------

Problem 2:

start (x,y,theta):  [5,60,0]
goal region (x,y,radius) = [100, 60, 20]
epsilon = 10


----------------------
Problem 3:

start (x,y,theta):  [10,90,3*pi/2]
goal region (x,y,radius) = [100, 90, 10]
epsilon = 5


----------------------
Problem 4:

start (x,y,theta):  [63,80,pi/2]
goal region (x,y,radius) = [60, 10, 10]
epsilon = 10

----------------------
Problem 5:

start (x,y,theta):  [40,40,pi/4]
goal region (x,y,radius) = [0, 0, 20]
epsilon = 20
%}

clc; clear; close all
warning off;

xdim=100;
ydim=100;

problem = 5;

if problem == 1

start_node = [80 60];
Target = [1 1];
radius = 20; 
eta = 5; %EPSILON

elseif problem == 2
start_node = [5 60];
Target = [100 60];
radius = 20; 
eta = 10; %EPSILON

elseif problem == 3

start_node = [10 90];
Target = [100 90];
radius = 10; 
eta = 5; %EPSILON

elseif problem == 4

start_node = [63 80];
Target = [60 10];
radius = 10; 
eta = 10; %EPSILON

elseif problem == 5 

start_node = [40 40];
Target = [1 1];
radius = 20; 
eta = 20; %EPSILON

else 

disp('Input problem statement not defined!!!');

end



ax=gca; backColor=[1 1 1];
ax.Color = backColor;
axis([0 xdim 0 ydim])
daspect([1 1 .1])
view(2);
grid on;
grid minor;



global eta d gama obd
d=2; 
gama=200; 
obd=5;
extrude=.5;

%% Define Obstacles: 
r = 4;
r2 = 8;
c1 = [80 40]; ob1 = [c1(1)-r c1(1)+r c1(2)-r c1(2)+r]; circleExtrude(c1(1), c1(1), r2);
c2 = [73 30]; ob2 = [c2(1)-r c2(1)+r c2(2)-r c2(2)+r]; circleExtrude(c2(1), c2(2), r2);
c3 = [63 25]; ob3 = [c3(1)-r c3(1)+r c3(2)-r c3(2)+r]; circleExtrude(c3(1), c3(2), r2);  
c4 = [53 25]; ob4 = [c4(1)-r c4(1)+r c4(2)-r c4(2)+r]; circleExtrude(c4(1), c4(2), r2);
c5 = [43 26]; ob5 = [c5(1)-r c5(1)+r c5(2)-r c5(2)+r]; circleExtrude(c5(1), c5(2), r2);
c6 = [33 25]; ob6 = [c6(1)-r c6(1)+r c6(2)-r c6(2)+r]; circleExtrude(c6(1), c6(2), r2);
c7 = [28 35]; ob7 = [c7(1)-r c7(1)+r c7(2)-r c7(2)+r]; circleExtrude(c7(1), c7(2), r2);
c8 = [25 47]; ob8 = [c8(1)-r c8(1)+r c8(2)-r c8(2)+r]; circleExtrude(c8(1), c8(2), r2);
c9 = [25 57]; ob9 = [c9(1)-r c9(1)+r c9(2)-r c9(2)+r]; circleExtrude(c9(1), c9(2), r2);
c10 = [25 67]; ob10 = [c10(1)-r c10(1)+r c10(2)-r c10(2)+r]; circleExtrude(c10(1), c10(2), r2);
c11 = [25 77]; ob11 = [c11(1)-r c11(1)+r c11(2)-r c11(2)+r]; circleExtrude(c11(1), c11(2), r2);
c12 = [35 80]; ob12 = [c12(1)-r c12(1)+r c12(2)-r c12(2)+r]; circleExtrude(c12(1), c12(2), r2);
c13 = [40 80]; ob13 = [c13(1)-r c13(1)+r c13(2)-r c13(2)+r]; circleExtrude(c13(1), c13(2), r2);
c14 = [45 80]; ob14 = [c14(1)-r c14(1)+r c14(2)-r c14(2)+r]; circleExtrude(c14(1), c14(2), r2);
c15 = [80 80]; ob15 = [c15(1)-r c15(1)+r c15(2)-r c15(2)+r]; circleExtrude(c15(1), c15(2), r2);
c16 = [85 80]; ob16 = [c16(1)-r c16(1)+r c16(2)-r c16(2)+r]; circleExtrude(c16(1), c16(2), r2);
c17 = [90 80]; ob17 = [c17(1)-r c17(1)+r c17(2)-r c17(2)+r]; circleExtrude(c17(1), c17(2), r2);
c18 = [95 80]; ob18 = [c18(1)-r c18(1)+r c18(2)-r c18(2)+r]; circleExtrude(c18(1), c18(2), r2);
c19 = [100 80]; ob19 =[c19(1)-r c19(1)+r c19(2)-r c19(2)+r]; circleExtrude(c19(1), c19(2), r2);
c20 = [100 0]; ob20 = [c20(1)-r c20(1)+r c20(2)-r c20(2)+r]; circleExtrude(c20(1), c20(2), r2);
c21 = [100 5]; ob21 = [c21(1)-r c21(1)+r c21(2)-r c21(2)+r]; circleExtrude(c21(1), c21(2), r2);
c22 = [100 10]; ob22 =[c22(1)-r c22(1)+r c22(2)-r c22(2)+r]; circleExtrude(c22(1), c22(2), r2);
c23 = [60 100]; ob23 =[c23(1)-r c23(1)+r c23(2)-r c23(2)+r]; circleExtrude(c23(1), c23(2), r2);

obstacles = [ob1; ob2; ob3; ob4; ob5; ob6; ob7; ob8; ob9; ob10; ob11; ob12; ob13; ...
             ob14; ob15; ob16; ob17; ob18; ob19; ob20; ob21; ob22; ob23];

circle(Target(1),Target(2),radius);
circleExtrude(30,80,5);
%% obtaining the random inital point
z=0;
while(z==0)
    
    V(1,:)=[xdim*rand ydim*rand];
    z=ObtacleFree(V(1,:),obstacles);
end
V(1,:)= start_node;   %uncomment to force inital position
% plot(V(1,1), V(1,2), '.k', 'MarkerSize',30)
%%

Cost(1,:)=[V 0];
vv=[V V];
iter=0;
stp=0; 

while (stp==0)
    
    iter=iter+1;
    
    xrand=[xdim*rand ydim*rand];        
    xnearest=Nearest(xrand,V);          
    xnew=Steer(xnearest,xrand);         
    
    if CollisionFree(xnearest,xnew,obstacles)
        V=[V;xnew];
        temp=(gama*log(length(V))/length(V))^(1/d);
        r=min(eta,temp);
        Xnear=Near(V,xnew,r);
        xmin=xnearest;
        
        costrow=find(any(Cost(:,1)==xnearest(1),2));
        cost=Cost(costrow,3)+norm(xnearest-xnew);
        cmin=cost;
        Cost=[Cost;[xnew cost]];
        oldc=cost;
        
        for indx=1:size(Xnear,1)
            xnear=Xnear(indx,:);
            costrow=find(any(Cost(:,1)==xnear(1),2));
            cxnear=Cost(costrow,3)+norm(xnear-xnew);    
            if CollisionFree(xnear,xnew,obstacles) &&  (cxnear<cmin)
                xmin=xnear; cmin=cxnear;
                   end
        end
        costrow=find(any(Cost(:,1)==xnew(1),2));
        Cost(costrow,:)=[];
        
        costrow=find(any(Cost(:,1)==xmin(1),2));
        cost=Cost(costrow,3)+norm(xmin-xnew);
        Cost=[Cost;[xnew cost]];
        vv=[vv;[xmin xnew]];
        plot([xmin(1) xnew(1)],[xmin(2) xnew(2)],'green') %% plot tree branch
        
        %% Rewire the tree
        for indx=1:size(Xnear,1)
            xnear=Xnear(indx,:);
            cost=cost+norm(xnew-xnear);
            costrow=find(any(Cost(:,1)==xnear(1),2));
            
            if CollisionFree(xnew,xnear,obstacles) &&  (cost<Cost(costrow,3))
                row=find(any(vv(:,3)==xnear(1),2));
                
                plot([vv(row,1) xnear(1)],[vv(row,2) xnear(2)],'Color',backColor)%delete old branch on the plot
                vv(row,:)=[];%delete old branch from the edges matrix
                vv=[vv;[xnew xnear]];                
                plot([xnew(1) xnear(1)],[xnew(2) xnear(2)],'r')%draw the new branch
            end
        end
        %%
        if norm(xnew-Target)<radius
            stp=1;
            row=find(any(vv(:,3)==xnew(1),2));
            pathpoints=[];
            while row>1
                parentx=vv(row,1);
                plot([vv(row,1) vv(row,3)],[vv(row,2) vv(row,4)],':r','LineWidth',3);
                pathpoints=[pathpoints;[vv(row,1) vv(row,2)]];
                row=find(any(vv(:,3)==parentx,2));
            end 
        end        
        drawnow update
    end
end


pat=[];
for i=1:size(pathpoints,1)-1
    n=eta*5;
    r=norm(pathpoints(i,:)-pathpoints(i+1,:))/n;
    
    for j=1:n
        pat=[pat;Steer2(pathpoints(i,:),pathpoints(i+1,:),j*r)];
        
    end
end

pause(2);

iter=1;

%% SMOOTHING:
ax=pat(1,1);
ay=pat(1,2);
pats=[];

for t=1:size(pat,1)
    f=0.98;
    ax=f*ax+(1-f)*pat(t,1);
    ay=f*ay+(1-f)*pat(t,2);
    pats=[pats;[ax ay]];
end

%% Import Robot:
C = robot;
C = [C{1} C{2}];

plot_freq = 40;

%% Follow the Smoothed path
plot(pats(:,1),pats(:,2),'cyan','LineWidth',2)

for k = size(pat,1):-1:2

    xdiff=pats(k-1,2)-pats(k,2);
    ydiff=pats(k-1,1)-pats(k,1);

    th(k)=atan2(ydiff,xdiff);
    camx=40*sin(th(k));
    camy=40*cos(th(k));


        % Rotational Matrix:
        R = [sin(th(k)) -cos(th(k));
            cos(th(k)) sin(th(k))]';
        C_rotated =  C * R;

    if mod(iter, plot_freq) == 0
        plot( C_rotated(:,1) + pats(k,1), C_rotated(:,2) + pats(k,2), 'blue.');
    end

    pause(.01)
    iter=iter+1;

end
pause(1)

mat_file_calc;

csvwrite(['Problem',num2str(problem),'.csv'], flipud([flipud(time) x y th2 v_now omegaf acc gammaf]));

