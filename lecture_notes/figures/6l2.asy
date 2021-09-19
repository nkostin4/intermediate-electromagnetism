import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective(1.0*(1.5,-0.7,0.2), up=Z);

surface conductor = scale3(3.0)*unitsphere;

draw(conductor, surfacepen=white+opacity(0.4));

draw((0,0,0) -- (3*sin(pi/4)*cos(pi/4),3*sin(pi/4)*sin(pi/4),3*cos(pi/4)), arrow=Arrow3, black, L=Label("$a$", position=0.8));

// Draw big Q
real R = 3.0;
triple f1(pair t) {
    return (R*cos(t.x),R*sin(t.x),t.y-1);
}
surface s = surface(f1,(0,0),(2*pi,2),5,5,Spline);
string text="$Q$";
real h=0.0125;
draw(surface(rotate(2)*xscale(0.1)*yscale(0.8)*text,s,-pi/4-1.5*pi/20,0.5,h), black);
