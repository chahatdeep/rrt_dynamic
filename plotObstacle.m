function [] = plotObstacle(ob)
x1=ob(1);x2=ob(2);y1=ob(3);y2=ob(4);
hold on
v = [x1 y1; x1 y2; x2 y2; x2 y1];
f = [1 2 3 4];
col=[0 0 0];
patch('Faces',f,'Vertices',v,'FaceColor',col,'EdgeColor',col)