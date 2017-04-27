function Out=CollisionFree(xnear,xnew,obstacles)

Out=1;
ri=norm(xnew-xnear)/100;
xi=xnear;

for c=1:100
    
    
    xi=Steer2(xi,xnew,ri);
    if ObtacleFree(xi,obstacles)==0
        Out=0;
    end
end

if ObtacleFree(xnew,obstacles)==0
    Out=0;
end
end