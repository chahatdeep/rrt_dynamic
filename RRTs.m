%% RRT* implementation
% Hassan Umari
% reference: Sampling-based Algorithms for Optimal Motion Planning,
% Emilio Frazzoli,Sertac Karaman
%Page 16
%%
close all
clear all
clc
xdim=100;
ydim=100;

fig=figure('name','Received Data','units','normalized','position',[0.15 0.06 0.7 .83]);
ax=gca; backColor=[222/255 222/255 239/255];
ax.Color = backColor;
axis([0 xdim 0 ydim])



%%
global eta d gama
eta=2; %growth distance (between nearset point towards the random point)
d=2; %2D space
gama=200; %check this????????????????????????
global obd
obd=0;
%% declaring obtacles (as points)
% x1 --> x2   y1-->y2    ob#=[x1 x2 y1 y2]
ob1=[0 20 95 100];plotObstacle(ob1);
ob2=[80 100  0  2];plotObstacle(ob2);
ob3=[30 70  30  40];plotObstacle(ob3);
ob4=[20 30  0  40];plotObstacle(ob4);
ob5=[0 20 80 85];plotObstacle(ob5);
ob6=[80 88  18  20];plotObstacle(ob6);
ob7=[80 82  0  20];plotObstacle(ob7);
ob8=[92 100  18  20];plotObstacle(ob8);
ob9=[98 100  0  20];plotObstacle(ob9);
ob10=[40 50  50  60];plotObstacle(ob10);
ob11=[50 60  70  80];plotObstacle(ob11);
ob12=[0 10  50  60];plotObstacle(ob12);
obstacles=[ob1;ob2;ob3;ob4;ob5;ob6;ob7;ob8;ob9;ob10;ob11;ob12];
%% Target
Target=[30 80];radius=5; circle(Target(1),Target(2),radius);
x1 = 26;y1 = 80.25;str1 = 'Target';text(x1,y1,str1,'Color','k','FontSize',15);
%% obtaining the random inital point
z=0;
while(z==0)
 
 V(1,:)=[xdim*rand ydim*rand];
 z=ObtacleFree(V(1,:),obstacles);
end
%V(1,:)=[35 25];   uncomment to force inital position
plot(V(1,1), V(1,2), '.k', 'MarkerSize',30)
%%


Cost(1,:)=[V 0];
vv=[V V];

iter=0; %loop counter,keeps track of the number of iterations 
stp=0; %%stop condition initally zero, when it reaches target it is set to 1
s='Data';s1 = '1';
while (1) 
   
iter=iter+1;
if iter>=10
    iter=0;
s = strcat(s,s1);
saveas(gcf,strcat(s,'.emf'))
saveas(gcf,strcat(s,'.fig'))
end
xrand=[xdim*rand ydim*rand];        %%pdf_Fazzoli_p16______________line3
xnearest=Nearest(xrand,V);          %%pdf_Fazzoli_p16______________line4
xnew=Steer(xnearest,xrand);         %%pdf_Fazzoli_p16______________line5

if CollisionFree(xnearest,xnew,obstacles)%pdf_Fazzoli_p16__________line6
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
plot([xmin(1) xnew(1)],[xmin(2) xnew(2)],'b') %% plot tree branch

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
    
    while row>1
        parentx=vv(row,1);
        plot([vv(row,1) vv(row,3)],[vv(row,2) vv(row,4)],':r','LineWidth',3);
        row=find(any(vv(:,3)==parentx,2));
    end
    
end

drawnow update 
end
end


