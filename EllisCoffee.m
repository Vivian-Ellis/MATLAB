%% Modified Euler's Method
%Dr. Oster wants to drink his coffee at 130 degrees F however at time t = 0
%the coffee is 175 degrees F. He will add Half and Half to taste but also
%to cool off the coffee before drinkning. The Half and Half is at 37
%degrees F when exiting the fridge.
T_k = 70;        %Temp of the kitchen in F
%He wants as few tablespoons of HH as possible but needs his coffee within
%two minutes.
V_1 = 12;        %The volume of the coffee in oz
T_c = 175;       %Temp of coffee in F
%Using Newtons Law of Cooling as a model fo the temp of coffee in a mug
k = .165;        %Rate of cooling per min
%We have two factors, when to add the HH and how much.
%% 1 Tablespoon of H&H 
tbls = 1;              %Tablespoons of Half and Half
V_2 = tbls * .5;       %Converting Tbls to oz
T_HH = 37;             %Temp of HH in F

deltat = .01;               %Change in time
t = [0 : deltat : 2.5];     %Incrimenting time
n = 2.5/deltat;             %Number of size
timeHH_added = 1;           %Time the half and half is added to the coffee
HH_added = 0;                %Flag, tells us if the HH had been added
for i=1:n
    deltaT_c = (-k)*(T_c(i)-T_k) * deltat;          %Change in the temp of coffee
    deltaT_HH = (-k)*(T_HH(i) - T_k) * deltat;      %Change in the temp of HH
    T_c(i+1) = T_c(i) + deltaT_c;
    T_HH(i+1) = T_HH(i) + deltaT_HH;
    if(t(i+1) >= timeHH_added && HH_added == 0)
        T_c(i+1)  = (V_1 * T_c(i+1)  + V_2 * T_HH(i+1) )/(V_1 + V_2); %Temp of the mixture in F
        T_HH(i+1)=T_c(i+1);
        HH_added = 1;
    end %if
end %for

figure
subplot(1,2,1)
set(gca,'fontsize',12)

hold on
title('Hot Coffee with 1 Tblsp of H&H')
xlabel('Time')
ylabel('Temp of Coffee')
plot(t,T_c,'k')
axis([0 2.5 120 175])
grid on
hold off

subplot(1,2,2)
set(gca,'fontsize',12)

hold on
title('1 Tbls Half and Half')
xlabel('Time')
ylabel('Temp of Half and Half')
plot(t,T_HH,'k')
axis([0 2.5 0 175])
grid on
hold off

%Notice that when 1 tablespoon is added at time 0 , 1 or 2 (mins) the temp 
%of the coffee at 2 minutes is the same, approx 141.5 degrees F which is 
%too hot for Dr. Oster to drink.

%% 2 Tablespoons of H&H
T_k = 70;        %Temp of the kitchen in F
%He wants as few tablespoons of HH as possible but needs his coffee within
%two minutes.
V_1 = 12;        %The volume of the coffee in oz
T_c = 175;       %Temp of coffee in F
%Using Newtons Law of Cooling as a model fo the temp of coffee in a mug
k = .165;        %Rate of cooling per min

tbls = 2;              %Tablespoons of Half and Half
V_2 = tbls * .5;       %Converting Tbls to oz
T_HH = 37;             %Temp of HH in F

deltat = .01;               %Change in time
t = [0 : deltat : 2.5];     %Incrimenting time
n = 2.5/deltat;             %Number of size
timeHH_added = 1;           %Time the half and half is added to the coffee
HH_added = 0                %Flag, tells us if the HH had been added
for i=1:n
    deltaT_c = (-k)*(T_c(i)-T_k) * deltat;          %Change in the temp of coffee
    deltaT_HH = (-k)*(T_HH(i) - T_k) * deltat;      %Change in the temp of HH
    T_c(i+1) = T_c(i) + deltaT_c;
    T_HH(i+1) = T_HH(i) + deltaT_HH;
    if(t(i+1) >= timeHH_added && HH_added == 0)
        T_c(i+1)  = (V_1 * T_c(i+1)  + V_2 * T_HH(i+1) )/(V_1 + V_2); %Temp of the mixture in F
        T_HH(i+1)=T_c(i+1);
        HH_added = 1;
    end %if
end %for

pause

figure
subplot(1,2,1)
set(gca,'fontsize',12)

hold on
title('Hot Coffee with 2 tblsp of H&H')
xlabel('Time')
ylabel('Temp of Coffee')
plot(t,T_c,'k')
axis([0 2.5 120 175])
grid on
hold off

subplot(1,2,2)
set(gca,'fontsize',12)
hold on
title('2 Tblsp Half and Half')
xlabel('Time')
ylabel('Temp of 2 Tblsp Half and Half')
plot(t,T_HH,'k')
axis([0 2.5 0 175])
grid on
hold off

%Notice that when 2 tablespoon is added at time 0 , 1 or 2 (mins) the temp 
%of the coffee at 2 minutes is the same, approx 137.84 degrees F which is 
%too hot for Dr. Oster to drink.

%% Adding HH Directly from the Fridge 
tbls = 2;              %Tablespoons of Half and Half
V_2 = tbls * .5;       %Converting Tbls to oz
T_HH = 37;             %Temp of HH in F

T_k = 70;        %Temp of the kitchen in F
%He wants as few tablespoons of HH as possible but needs his coffee within
%two minutes.
V_1 = 12;        %The volume of the coffee in oz
T_c = 175;       %Temp of coffee in F
%Using Newtons Law of Cooling as a model fo the temp of coffee in a mug
k = .165;        %Rate of cooling per min

deltat = .01;               %Change in time
t = [0 : deltat : 3.5];     %Incrimenting time
n = 3.5/deltat;             %Number of size
timeHH_added = 2.6;         %Time the half and half is added to the coffee
HH_added = 0;               %Flag, tells us if the HH had been added
for i=1:n
    deltaT_c = (-k)*(T_c(i)-T_k) * deltat;
    deltaT_HH = (-k)*(T_HH(i) - T_k) * deltat;
    T_c(i+1) = T_c(i) + deltaT_c;
    
    if(t(i+1)<timeHH_added)
        deltaT_HH=0;             %There is no change of the HH   
    end %if    
    
    T_HH(i+1) = T_HH(i) + deltaT_HH;
    
    if(t(i+1) >= timeHH_added && HH_added == 0)
        T_c(i+1)  = (V_1 * T_c(i+1)  + V_2 * T_HH(i+1) )/(V_1 + V_2); %Temp of the mixture in F
        T_HH(i+1)=T_c(i+1);
        HH_added = 1;
    end %if
end %for

pause
figure

subplot(1,2,1)
set(gca,'fontsize',12)
hold on
title('Mixture w/ H&H')
xlabel('Time')
ylabel('Temp of Coffee')
plot(t,T_c,'k')
axis([0 3.5 120 175])
grid on
hold off

subplot(1,2,2)
set(gca,'fontsize',12)
hold on
title('H&H Directly from Fridge')
xlabel('Time')
ylabel('Temp of Half and Half')
plot(t,T_HH,'k')
axis([0 3.5 0 175])
grid on
hold off

pause
close all