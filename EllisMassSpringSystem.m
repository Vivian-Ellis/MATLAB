clear all
%% Mass - Spring Systems
%% 1 
%Consider the driven, undamped oscillator initially at equilibrium
%f(t) = y'' + 4y;    %f(t) the driving force
%I will let v = y' then v'=y'' thus,
%F = v' + 4y;        %F is the forcing term
%y(0) = 0;           %Given initial conditions
%y'(0) = 0;
%I will use Euler's method
%a)
dt=0.001;
b=6;            %end time
t=(0:dt:b);     %time from 0 to b increasing dt steps
n=b/dt;
%Given initial conditions:
y(1)=0;
v(1)=0;     

for k=1:n

    tt = (k-1)*dt;
    if(tt < 1 || tt >= 2)
        F = 0;
    else%(1<= tt < 2)
        F = 1;
    end%if else

    dy = v(k) *dt;
    dv =(F-4*y(k)) *dt;
    
    y(k+1)=y(k)+dy;
    v(k+1)=v(k)+dv;

end%for

figure
subplot(1,2,1)
set(gca,'fontsize',13)

hold on
title('Position 1a')
xlabel('Time')
ylabel('f(t)')
axis([0 6 -1 1])
grid on
plot(t,y) 
hold off


subplot(1,2,2)
set(gca,'fontsize',13)

hold on
title('Velocity 1a')
xlabel('Time')
ylabel('f(t)')
plot(t,v);
axis([0 6 -1 1])
grid on
hold off
%end problem 1a)
%b)
pause
close all

%Recall that F is the forcing term and I let v=y' then v'=y''
dt=0.0001;
b=6;            %end time
t=(0:dt:b);     %time from 0 to b increasing dt steps
n=b/dt;
%Given initial conditions:
y(1)=0;
v(1)=0;     

for k=1:n

    tt = (k-1)*dt;
    if(tt >= 0 && tt < 1)
        F = tt;
    else%(tt >= 1)
        F = 0;
    end%if else

    dy = v(k) *dt;
    dv =(F-4*y(k)) *dt;
    
    y(k+1)=y(k)+dy;
    v(k+1)=v(k)+dv;

end%for

figure
subplot(1,2,1)
set(gca,'fontsize',13)

hold on
title('Position 1b')
xlabel('Time')
ylabel('f(t)')
axis([0 6 -.5 .5])
grid on
plot(t,y) 
hold off


subplot(1,2,2)
set(gca,'fontsize',13)

hold on
title('Velocity 1b')
xlabel('Time')
ylabel('f(t)')
plot(t,v);
axis([0 6 -.5 .5])
grid on
hold off
%end b
%% 2 
%We are to assume no damping
m = 1;      %the mass in slugs
k = 4;      %the spring constant
V = 2/m;    %the instantaneous change in velocity ft/s

%The DE is, my'' + ky = f(t) an external force at time t
%So, y'' + 4y = f(t) let u = y' then,
%F = u' + 4y with F the forcing term

dt=0.0001;
b=10;            %end time
t=(0:dt:b);      %time from 0 to b increasing dt steps
n=b/dt;

%Given intitial conditions
y(1)=0;
V(1)=0;

firstStrike=0;      %flag    
secondStrike=0;     %flag

timeFirstStrike=pi;
timeSecondStrike=2*pi;
for k=1:n

    dy = V(k) *dt;
    dV =(-4*y(k)) *dt;
    
    y(k+1)=y(k)+dy;
    V(k+1)=V(k)+dV;
    
    tt = (k)*dt;
    if(tt >= timeFirstStrike && firstStrike==0)
        V(k+1)=V(k+1)+2;
        firstStrike = 1;
    elseif(tt >= timeSecondStrike && secondStrike==0)
        V(k+1)=V(k+1)-2;
        secondStrike = 1;
    end%if else

end%for

pause
close all

hold on
set(gca,'fontsize',13)
title('Hammer Strike')
xlabel('Time')
ylabel('Position')
plot(t,-y);
grid on
hold off

%% Changing code to have hammer strike ocurr at different time
%We are to assume no damping
m = 1;      %the mass in slugs
k = 4;      %the spring constant
V = 2/m;    %the instantaneous change in velocity ft/s

%The DE is, my'' + ky = f(t) an external force at time t
%So, y'' + 4y = f(t) let u = y' then,
%F = u' + 4y with F the forcing term

dt=0.0001;
b=15;            %end time
t=(0:dt:b);      %time from 0 to b increasing dt steps
n=b/dt;

%Given intitial conditions
y(1)=0;
V(1)=0;

firstStrike=0;      %flag    
secondStrike=0;     %flag

timeFirstStrike=2*pi;
timeSecondStrike=(5/2)*pi;
for k=1:n

    dy = V(k) *dt;
    dV =(-4*y(k)) *dt;
    
    y(k+1)=y(k)+dy;
    V(k+1)=V(k)+dV;
    
    tt = (k)*dt;
    if(tt >= timeFirstStrike && firstStrike==0)
        V(k+1)=V(k+1)+2;
        firstStrike = 1;
    elseif(tt >= timeSecondStrike && secondStrike==0)
        V(k+1)=V(k+1)-2;
        secondStrike = 1;
    end%if else

end%for

pause
close all

set(gca,'fontsize',13)

subplot(1,2,1);
plot(t,-y);
xlabel('Time')
ylabel('p')
title('Position')
grid on


set(gca,'fontsize',13)
subplot(1,2,2);
plot(t,V);
ylabel('v')
xlabel('Time')
title('Velocity')
axis([0 15 -5 5])
grid on

