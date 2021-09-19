import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective(1.0*(6.0*cos(291*pi/180),6.0*sin(291*pi/180),4), up=Z);

real innerangle = radians(60);
real outerangle = radians(70);
real midangle = radians(0);

path brace(pair a, pair b, real amplitude = 0.14*length(b-a)) {
    transform t = identity();
    real length = length(b-a);
    real sign = 1;
    if (amplitude < 0) {
        sign=-1;
    }
    path brace = (0,0){expi(sign*outerangle)} :: {expi(sign*midangle)} (length/4, amplitude/2) :: {expi(sign*innerangle)} (length/2, amplitude) {expi(-sign*innerangle)} :: {expi(-sign*midangle)}(3*length/4, amplitude/2) :: {expi(-sign*outerangle)} (length,0);
    real angle = degrees(atan2((b-a).y, (b-a).x));
    t = rotate(angle)*t;
    t = shift(a)*t;
    return t*brace;	
}

// draw coordinate axis
draw((8*cos(3*pi/4),8*sin(3*pi/4),0) -- (8*cos(-pi/4),8*sin(-pi/4),0), arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
draw((8*cos(5*pi/4),8*sin(5*pi/4),0) -- (8*cos(pi/4),8*sin(pi/4),0), arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
draw(-7Z -- 10Z, arrow=Arrow3(TeXHead2));

// draw sphere
// surface sphere = scale3(0.3)*unitsphere;
// draw(sphere, palegray+opacity(.4));

// draw big
real R = 12; // this variable represents the length of the big radial segment
draw(O -- (R*sin(pi/4)*cos(0),R*sin(pi/4)*sin(0),R*cos(pi/4)), black);

// draw theta arc
// self-explanatory
draw(arc(c=O, (1*sin(pi/4)*cos(0),1*sin(pi/4)*sin(0),1*cos(pi/4)), Z), black, L=Label("$\theta$", position=0.5, align=N));

// draw E0
real E0 = 5.0; // this represents the vertical length of E0
draw((R*sin(pi/4)*cos(0),R*sin(pi/4)*sin(0),R*cos(pi/4)) -- (R*sin(pi/4)*cos(0),R*sin(pi/4)*sin(0),R*cos(pi/4)+E0), black, arrow=Arrow3());

// label E0
path3 brace = shift(-0.2,R*sin(pi/4)*sin(0),0)*rotate(90,X)*path3(brace((R*sin(pi/4)*cos(0),R*cos(pi/4)), (R*sin(pi/4)*cos(0),R*cos(pi/4)+E0)));
draw(brace);
label("$E_o$", position=midpoint(brace), align=W);

// draw E0*cos(theta)
real ER = 3; // this represents the radial component of E0
draw((R*sin(pi/4)*cos(0),R*sin(pi/4)*sin(0),R*cos(pi/4)) -- ((R+ER)*sin(pi/4)*cos(0),(R+ER)*sin(pi/4)*sin(0),(R+ER)*cos(pi/4)), black);

// label E0*cos(theta)
path3 bracec = shift(R*sin(pi/4)*cos(0)+0.1,R*sin(0)*sin(pi/4),R*cos(pi/4)-0.1)*rotate(180,(R*sin(pi/4)*cos(0),R*sin(pi/4)*sin(0),R*cos(pi/4)))*rotate(45,Y)*rotate(90,X)*path3(brace((0,0), (0,ER)));
draw(bracec);
label("$E_o \cos{\theta}$", position=midpoint(bracec), align=SE);

// draw E0*sin(theta)
draw(((R+ER)*sin(pi/4)*cos(0),(R+ER)*sin(pi/4)*sin(0),(R+ER)*cos(pi/4)) -- (R*sin(pi/4)*cos(0),R*sin(pi/4)*sin(0),R*cos(pi/4)+E0), black);

// label E0*sin(theta)
path3 braces = shift((R+ER+0.2)*sin(pi/4)*cos(0),(R+ER+0.2)*sin(0)*sin(pi/4),(R+ER+0.2)*cos(pi/4))*rotate(36.87,(0,4,0),Y)*rotate(180,Z)*rotate(90,X)*path3(brace((0,0), (0,3.58)));
draw(braces);
label("$E_o \sin{\theta}$", position=midpoint(braces), align=NE);

// new theta arc
// hopefully self explanatory
draw(shift(R*sin(pi/4)*cos(0),R*sin(pi/4)*sin(0),R*cos(pi/4))*arc(c=O, (1*sin(pi/4)*cos(0),1*sin(pi/4)*sin(0),1*cos(pi/4)), Z), black, L=Label("$\theta$", position=0.5, align=N));
