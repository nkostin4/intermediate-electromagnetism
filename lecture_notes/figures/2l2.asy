import three;
import graph3;

size(6cm,0);

currentprojection=perspective((8.0*cos(315*pi/180),8.0*sin(315*pi/180),0), up=Z);

surface pointcharge = scale3(0.06)*unitsphere;
draw(pointcharge, surfacepen = black);

triple g(pair uz) {
	real u = uz.x; real z = uz.y;
	return (0.5*cos(u), 0.5*sin(u), sqrt(1)*z);
}

path3 vector2(pair z) {
	triple v = g(z);
	return O -- (v.x, v.y, 1);
}

add(vectorfield(vector2, g, (0,-0.75), (2pi, 0.5), 6, 0.25, black, render(merge=true)));
