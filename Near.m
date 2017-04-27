function Xnear=Near(V,xnew,r)
Xnear=[];

for i=1:size(V,1)
   
    if norm(xnew-V(i,:))<=r && norm(xnew-V(i,:))>0
        Xnear=[Xnear;V(i,:)];
    end
     
     
end



end 