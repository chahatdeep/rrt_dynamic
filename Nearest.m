function [xnearest] = Nearest(x,V)
for i=1:(size(V,1) )
  L(i)= norm(x-V(i,:));
end
 [p,I]=min(L);
xnearest=V(I,:);
end