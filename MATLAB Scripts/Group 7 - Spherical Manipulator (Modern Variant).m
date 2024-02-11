disp("Spherical Modern Variant")

syms a1 a2 a3 t1 t2 d3

%% Link Lengths

a1 = 10;
a2 = 10;
a3 = 5;

%% Joint Variables

t1 = 0;
t2 = 0;
d3 = 5;

%% D-H Parameters: [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0, offset = 0, after offset put the value of theta

H0_1 = Link([0,a1,0,pi/2,0,t1]);
H0_1.qlim = pi/180*[-90 90];

H1_2 = Link([0,0,a2,pi/2,0,t2]);
H1_2.qlim = pi/180*[0 90];

H2_3 = Link([0,0,0,0,1,a3]);
H2_3.qlim = [0 d3];

%% Build Mechanical Manipulator

Mod_Sphere = SerialLink([H0_1 H1_2 H2_3], 'name', 'RRP')
Mod_Sphere.plot([0 0 0], 'workspace', [-20 20 -20 20 -25 30])
Mod_Sphere.teach



