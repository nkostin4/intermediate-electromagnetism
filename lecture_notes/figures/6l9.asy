import three;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective((8.0*cos(315*pi/180),8.0*sin(315*pi/180),0), up=Z);

// draw sphere a
real arad = 4.0;
surface a = scale3(arad)*unitsphere;
draw(a, palegray+opacity(0.4));
draw((0,0,0) -- (arad*sin(pi/4)*cos(0),arad*sin(pi/4)*sin(0),arad*cos(pi/4)), black, L=Label("$a$", position=0.8));

// draw sphere b
real brad = 2.0;
real shiftb = 19.0;
surface b = shift((shiftb,0,0))*scale3(brad)*unitsphere;
draw(b, palegray+opacity(0.4));
draw(shift(shiftb*X)*(O -- (brad*sin(pi/4)*cos(0),brad*sin(pi/4)*sin(0),brad*cos(pi/4))), black, L=Label("$b$", position=0.8));

// draw connection between spheres
draw(shift(arad*X)*align(unit(X))*scale(0.25,0.25,(shiftb-3*brad))*unitcylinder,surfacepen=palegray+opacity(0.5));
