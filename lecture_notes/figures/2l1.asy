import three;
import graph3;

defaultpen(fontsize(46pt));

size(2cm,0);

currentprojection=perspective((8.0*cos(15*pi/180),8.0*sin(15*pi/180),0), up=Z);

surface pointcharge = scale3(0.01)*unitsphere;
draw(pointcharge, surfacepen = black);
draw(O -- 0.01*Z, black, L=Label("$+q$", position=EndPoint,
align=NE));
