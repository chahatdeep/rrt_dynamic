function []=plotObstacleExtrude(ob)
x=ob(1); y=ob(3); z=0; 
lx=ob(2)-ob(1); ly=ob(4)-ob(3); lz=2;


x=[x (lx+x) (lx+x) x x x;(lx+x) (lx+x) x x (lx+x) (lx+x);(lx+x) (lx+x) x x (lx+x) (lx+x);x (lx+x) (lx+x) x x x];
y=[y y (ly+y) (ly+y) y y;y (ly+y) (ly+y) y y y;y (ly+y) (ly+y) y (ly+y) (ly+y);y y (ly+y) (ly+y) (ly+y) (ly+y)];
z=[z z z z z (lz+z);z z z z z (lz+z);(lz+z) (lz+z) (lz+z) (lz+z) z (lz+z);(lz+z) (lz+z) (lz+z) (lz+z) z (lz+z)];
for i=1:6
    col=[0 0 0];
    h=patch(x(:,i),y(:,i),z(:,i),'y');
    
    set(h,'edgecolor','k','FaceColor',col)
end