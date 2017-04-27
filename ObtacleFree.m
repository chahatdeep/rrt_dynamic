function [out] = ObtacleFree(xnew,obstacles)
global obd
for i=1:size(obstacles,1)
if xnew(1)>=obstacles(i,1)-obd && xnew(1)<=obstacles(i,2)+obd && xnew(2)>=obstacles(i,3)-obd && xnew(2)<=obstacles(i,4)+obd
out=0;
break
else
out=1;

end
end