function [xnew] = Steer(xnearest,xrand,r)
yr=xrand(2);
xr=xrand(1);
y0=xnearest(2);
x0=xnearest(1);

m=(yr-y0)/(xr-x0);

xnew(1)=(sign(xr-x0))*(((r^2)/((m^2)+1))^0.5)+x0;
xnew(2)=m*(xnew(1)-x0)+y0;
if xr==x0
   xnew(1)=x0;
   xnew(2)=y0+r;
end
end