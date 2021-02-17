%% Swimming Dog
clear all
%% Stream Speed 3mph
%A dog jumps into the river and is headed directly for a tree
s=3;    %The stream speed in mph
w=30;   %river width in ft
v=4;    %swim speed of the dog in mph
%Assume the river is perfectly straigh and the dog instantaneously attains
%the swimming speed of v and jumps in head first

%The system of differential equations:

%  dx=v*cos(phi) *dt;
%  dy=(v*sin(phi)+s) *dt;
    
%dy/dx=tan(phi)+(s/v)*sec(phi);

dt=0.00001;
b=15;            %end time
t=(0:dt:b);      %time from 0 to b increasing dt steps
n=b/dt;

%Given intitial conditions
x(1)=0;
y(1)=w;

treeReached =0;
k=1;

while (k<=n && treeReached == 0)

    dx=-v*(x(k)/sqrt(x(k)^2 + y(k)^2)) *dt;
    dy=(-v*(y(k)/sqrt(x(k)^2 + y(k)^2))+s) *dt;
    
    y(k+1)=y(k)+dy;
    x(k+1)=x(k)+dx;
    
    if(x(k+1)<= .00000000000001)
        treeReached =1;
    end%if
    k=k+1;
    %tt = k*dt;
end%for

plot(x,y)
title('Swimming Dog')
xlabel('mph')
ylabel('River width')
grid on