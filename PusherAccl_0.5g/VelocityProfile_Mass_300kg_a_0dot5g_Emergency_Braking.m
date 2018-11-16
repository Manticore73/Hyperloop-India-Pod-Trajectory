%Variable Initialization%
syms M_pod a_pusher g v
g=9.81;
%Input%
%line1 = 'Enter the pod mass:';
%M_pod = input(line1);
M_pod=300;
%line2 = 'Enter the pusher force "g" value:';
%a_pusher = input(line2);
a_pusher=0.5*g;

%%%%%%%%%%%%%%%%%Drag Equations%%%%%%%%%%%%%%%%%%%%
syms F_lev1 F_lev2 F_lev3 F_lev4 F_aero F_lsd
F_lev1 = (-34.56.*v.^2)+(228.8.*v)-36.51;
F_lev2 = (-0.004851.*v.^3)+(0.592.*v.^2)-(24.25.*v)+418.2;
F_lev3 = 72.832;
F_aero = ((5.9820e-05).*v.^3)-((6.4e-03).*v.^2)+(0.3478.*v)-0.5432;
F_lsd = 12;

%%%%%%%%%%%%%%%%%%%%%%%Braking Equations%%%%%%%%%%%%%%%%%%%%%%%%%
syms F_Embrk1 F_Embrk2
F_Embrk1 = (-0.002144*v^3)+(0.7706*v^2)-(103.7*v)+9789;
F_Embrk2 = (-113.6*v^2)+(1984*v)+81.99;

%%%%%%%%%%%%%%%%%%%%%%%%%%% Acceleration Phase %%%%%%%%%%%%%%%%%%%%%%%%%%
%Peak Drag Phase(0<v<3.52)%
syms t1 s1 vt1 vs1
t1 = vpa(int((M_pod./((M_pod.*a_pusher)-(4.*F_lev1)-F_aero-F_lsd)),v,0,3.52),5);
s1 = vpa(int(((M_pod.*v)./((M_pod.*a_pusher)-(4.*F_lev1)-F_aero-F_lsd)),v,0,3.52),5);
disp('Phase 1 Time');
disp(t1);
disp('Phase 1 Distance');
disp(s1);

%lift off velocity phase (3.52<v<20)%
syms t2 s2 
t2 = vpa(int((M_pod./((M_pod.*a_pusher)-(4.*F_lev2)-F_aero-F_lsd)),v,3.52,20),5);
s2 = vpa(int(((M_pod.*v)./((M_pod.*a_pusher)-(4.*F_lev2)-F_aero-F_lsd)),v,3.52,20),5);
disp('Phase 2 Time');
disp(t1+t2);
disp('Phase 2 Distance');
disp(s1+s2);

%decreasing drag phase (20<v<58) LSD drag is absent from this phase%
syms t3 s3 
t3 = vpa(int((M_pod./((M_pod.*a_pusher)-(4.*F_lev2)-F_aero)),v,20,56.5),5);
s3 = vpa(int(((M_pod.*v)./((M_pod.*a_pusher)-(4.*F_lev2)-F_aero)),v,20,56.5),5);
disp('Phase 3 Time');
disp(t1+t2+t3);
disp('Phase 3 Distance');
disp(s1+s2+s3);

%%%%%%%%%%%%%%%%%%%%%%%% Constant Cruise Range %%%%%%%%%%%%%%%%%%%%%%
syms t5 s5  
t5 = vpa(int(((M_pod)./(-(4.*F_lev2)-F_aero)),v,56.5,40),5);
s5 = vpa(int(((M_pod.*v)./(-(4.*F_lev2)-F_aero)),v,56.5,40),5); %for pusher acceleration of 0.5g% 
disp('Phase 5 Time');
disp(t1+t2+t3+t5);
disp('Phase 5 Distance');
disp(s1+s2+s3+s5);

%%%%%%%%%%%%%%%%%%%%%%%% Braking Phase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 55<v<10 %
syms t7 s7  
t7 = vpa(int(((M_pod)./(-F_Embrk1-(4.*F_lev2)-F_aero)),v,40,10),5);
s7 = vpa(int(((M_pod.*v)./(-F_Embrk1-(4.*F_lev2)-F_aero)),v,40,10),5); %for pusher acceleration of 0.5g% 
disp('Phase 7 Time- Brakes Deploy');
disp(t1+t2+t3+t5+t7);
disp('Phase 7 Distance');
disp(s1+s2+s3+s5+s7);


% 3.52<v<0 %
syms t8 s8  
t8 = vpa(int(((M_pod)./(-F_Embrk2-(4.*F_lev2)-F_aero-F_lsd)),v,10,3.52),5);
s8 = vpa(int(((M_pod.*v)./(-F_Embrk2-(4.*F_lev2)-F_aero-F_lsd)),v,10,3.52),5); %for pusher acceleration of 0.5g% 
disp('Phase 8 Time');
disp(t1+t2+t3+t5+t7+t8);
disp('Phase 8 Distance');
disp(s1+s2+s3+s5+s7+s8);

% 3.52<v<0 %
syms t9 s9  
t9 = vpa(int(((M_pod)./(-F_Embrk2-(4.*F_lev1)-F_aero-F_lsd)),v,3.52,0.1),5);
s9 = vpa(int(((M_pod.*v)./(-F_Embrk2-(4.*F_lev1)-F_aero-F_lsd)),v,3.52,0.1),5); %for pusher acceleration of 0.5g% 
disp('Phase 9 Time');
disp(t1+t2+t3+t5+t7+t8+t9);
disp('Phase 9 Distance');
disp(s1+s2+s3+s5+s7+s8+t9);
plot(TimeN_half_gEmergency,DistanceN_half_gEmergency)
%plot(TimeN_half_gEmergency,VelocityN_half_gEmergency)