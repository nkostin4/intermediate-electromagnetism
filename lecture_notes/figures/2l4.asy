import three;
import graph3;

size(6cm,0);

currentprojection=perspective((8.0*cos(10*pi/180),8.0*sin(10*pi/180),0), up=Z);

// draw point charge
real prad = 0.1;
surface pointcharge = scale3(prad)*unitsphere;
draw(pointcharge, surfacepen = black);
draw(O -- prad*X, black, L=Label("$+q$", position=EndPoint,
align=NE));

triple f(pair uv) {
	real u = uv.x; real v = uv.y;
	return (sqrt(2)*sin(u)*cos(v), sqrt(2)*sin(u)*sin(v), sqrt(2)*cos(u));
}

path3 vector(pair z) {
	triple v = f(z);
	return O -- (v.x, v.y, v.z);
}

// draw electric field
real emag = 0.75;
real erad = sqrt(2);
add(vectorfield(vector, f, (0,0), (pi, 2pi), 4, emag, black, render(merge=true)));
draw((erad*sin(pi/4)*cos(-pi/2),erad*sin(pi/4)*sin(-pi/2),erad*cos(pi/4)) -- ((erad+emag)*sin(pi/4)*cos(-pi/2),(erad+emag)*sin(pi/4)*sin(-pi/2),(erad+emag)*cos(pi/4)), black, arrow=Arrow3(), L=Label("$\vec{E}$", position=EndPoint));


// draw Gaussian sphere
real grad = sqrt(2);
surface gaussian = scale3(grad)*unitsphere;
draw(gaussian, palegray+opacity(0.4));

// draw dA patch
real toptheta = 0.90*8*pi/18;
real bottomtheta = 8*pi/18;
real leftphi = 0.90*pi/4;
real rightphi = 1.00*pi/4;
draw(arc(c=O, (grad*sin(toptheta)*cos(rightphi),grad*sin(toptheta)*sin(rightphi),grad*cos(toptheta)), (grad*sin(bottomtheta)*cos(rightphi), grad*sin(bottomtheta)*sin(rightphi), grad*cos(bottomtheta))), black);
draw(arc(c=O, (grad*sin(toptheta)*cos(leftphi),grad*sin(toptheta)*sin(leftphi),grad*cos(toptheta)), (grad*sin(bottomtheta)*cos(leftphi), grad*sin(bottomtheta)*sin(leftphi), grad*cos(bottomtheta))), black);
draw(arc(c=O, (grad*sin(toptheta)*cos(leftphi),grad*sin(toptheta)*sin(leftphi),grad*cos(toptheta)), (grad*sin(toptheta)*cos(rightphi),grad*sin(toptheta)*sin(rightphi),grad*cos(toptheta))), black);
draw(arc(c=O, (grad*sin(bottomtheta)*cos(leftphi),grad*sin(bottomtheta)*sin(leftphi),grad*cos(bottomtheta)), (grad*sin(bottomtheta)*cos(rightphi),grad*sin(bottomtheta)*sin(rightphi),grad*cos(bottomtheta))), black);

// draw dA vector
real drad = sqrt(2)+0.3;
draw((grad*sin((toptheta+bottomtheta)/2)*cos((leftphi+rightphi)/2),grad*sin((toptheta+bottomtheta)/2)*sin((leftphi+rightphi)/2),grad*cos((toptheta+bottomtheta)/2)) -- (drad*sin((toptheta+bottomtheta)/2)*cos((leftphi+rightphi)/2),drad*sin((toptheta+bottomtheta)/2)*sin((leftphi+rightphi)/2),drad*cos((toptheta+bottomtheta)/2)), black, arrow=Arrow3(), L=Label("$dA$", position=EndPoint));
