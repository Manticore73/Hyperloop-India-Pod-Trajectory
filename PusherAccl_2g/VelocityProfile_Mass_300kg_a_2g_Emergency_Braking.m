%Variable Initialization%
syms M_pod a_pusher g v
g=9.81;
%Input%
%line1 = 'Enter the pod mass:';
%M_pod = input(line1);
M_pod=250;
%line2 = 'Enter the pusher force "g" value:';
%a_pusher = input(line2);
a_pusher=2*g;

%%%%%%%%%%%%%%%%%Drag Equations%%%%%%%%%%%%%%%%%%%%
syms F_lev1 F_lev2 F_lev3 F_lev4 F_aero F_lsd
F_lev1 = (-34.56.*v.^2)+(228.8.*v)-36.51;
F_lev2 = (-0.004851.*v.^3)+(0.592.*v.^2)-(24.25.*v)+418.2;
F_lev3 = 72.832;
F_aero = ((5.9820e-05).*v.^3)-((6.4e-03).*v.^2)+(0.3478.*v)-0.5432;
F_lsd = 12;

%%%%%%%%%%%%%%%%%%%%%%%Braking Equations%%%%%%%%%%%%%%%%%%%%%%%%%
syms F_brk1 F_brk2
F_brk1 = (-0.001531*v^3)+(0.5369*v^2)-(69.73*v)+6262;
F_brk2 = (-72.79*v^2)+(1268*v)+52.67;

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

%decreasing drag phase (20<v<59.35) LSD drag is absent from this phase%
syms t3 s3 
t3 = vpa(int((M_pod./((M_pod.*a_pusher)-(4.*F_lev2)-F_aero)),v,20,59.35),5);
s3 = vpa(int(((M_pod.*v)./((M_pod.*a_pusher)-(4.*F_lev2)-F_aero)),v,20,59.35),5);
disp('Phase 3 Time');
disp(t1+t2+t3);
disp('Phase 3 Distance');
disp(s1+s2+s3);

%Constant Drag Phase%
syms t4 s4  
t4 = vpa(int(((M_pod)./((M_pod.*a_pusher)-(4.*F_lev3)-F_aero)),v,59.35,133.5),5);
s4 = vpa(int(((M_pod.*v)./((M_pod.*a_pusher)-(4.*F_lev3)-F_aero)),v,59.35,133.5),5); %for pusher acceleration of 2g% 
disp('Phase 4 Time');
disp(t1+t2+t3+t4);
disp('Phase 4 Distance');
disp(s1+s2+s3+s4);

%%%%%%%%%%%%%%%%%%%%%%%% Constant Cruise Range %%%%%%%%%%%%%%%%%%%%%%
syms t5 s5  
%t5 = vpa(int(((M_pod)./(-(4.*F_lev3)-F_aero)),v,134.276,133),5);
%s5 = vpa(int(((M_pod.*v)./(-(4.*F_lev3)-F_aero)),v,134.276,133),5); %for pusher acceleration of 2g% 
%disp('Phase 5 Time');
%disp(t1+t2+t3+t4+t5);
%disp('Phase 5 Distance');
%disp(s1+s2+s3+s4+s5);
t5=0;
s5=0;

%%%%%%%%%%%%%%%%%%%%%%%% Braking Phase %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initial Braking (135<v<59.35)%
syms t6 s6  
t6 = vpa(int(((M_pod)./(-F_brk1-(4.*F_lev3)-F_aero)),v,133.5,59.35),5);
s6 = vpa(int(((M_pod.*v)./(-F_brk1-(4.*F_lev3)-F_aero)),v,133.5,59.35),5); %for pusher acceleration of 2g% 
disp('Phase 6 Time');
disp(t1+t2+t3+t4+t5+t6);
disp('Phase 6 Distance');
disp(s1+s2+s3+s4+s5+s6);

% 59.35<v<10 %
syms t7 s7  
t7 = vpa(int(((M_pod)./(-F_brk1-(4.*F_lev2)-F_aero)),v,59.35,10),5);
s7 = vpa(int(((M_pod.*v)./(-F_brk1-(4.*F_lev2)-F_aero)),v,59.35,10),5); %for pusher acceleration of 2g% 
disp('Phase 7 Time');
disp(t1+t2+t3+t4+t5+t6+t7);
disp('Phase 7 Distance');
disp(s1+s2+s3+s4+s5+s6+s7);


% 3.52<v<0 %
syms t8 s8  
t8 = vpa(int(((M_pod)./(-F_brk2-(4.*F_lev2)-F_aero-F_lsd)),v,10,3.52),5);
s8 = vpa(int(((M_pod.*v)./(-F_brk2-(4.*F_lev2)-F_aero-F_lsd)),v,10,3.52),5); %for pusher acceleration of 2g% 
disp('Phase 8 Time');
disp(t1+t2+t3+t4+t5+t6+t7+t8);
disp('Phase 8 Distance');
disp(s1+s2+s3+s4+s5+s6+s7+s8);

% 3.52<v<0 %
syms t9 s9  
t9 = vpa(int(((M_pod)./(-F_brk2-(4.*F_lev1)-F_aero-F_lsd)),v,3.52,0.1),5);
s9 = vpa(int(((M_pod.*v)./(-F_brk2-(4.*F_lev1)-F_aero-F_lsd)),v,3.52,0.1),5); %for pusher acceleration of 2g% 
disp('Phase 9 Time');
disp(t1+t2+t3+t4+t5+t6+t7+t8+t9);
disp('Phase 9 Distance');
disp(s1+s2+s3+s4+s5+s6+s7+s8+t9);
%plot(Time,Distance)
%plot(Time,Velocity)
