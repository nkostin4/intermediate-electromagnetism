import three;
import graph3;

defaultpen(fontsize(2pt));

size(6cm,0);

currentprojection=perspective(1.0*(6.0*cos(66*pi/180),6.0*sin(66*pi/180),1), up=Z);

// draw the conducting sphere
surface conductor = scale3(3.0)*unitsphere;
draw(conductor, surfacepen=white+opacity(0.4));
// it has radius a
real phiv = 7*pi/8;
draw((0,0,0) -- (3*sin(pi/4)*cos(phiv),3*sin(pi/4)*sin(phiv),3*cos(pi/4)), black, L=Label("$a$", position=0.8));

// label the redistribution of positive charges
triple f(real t) {
    return (cos(t), sin(t), sqrt(8));
}
path3 p = graph(f, 0, 2*pi);
Label PosCharge1 = Label("$+$", black, position=BeginPoint);
label(PosCharge1,p);
Label PosCharge2 = Label("$+$", black, position=MidPoint);
label(PosCharge2,p);
Label PosCharge3 = Label("$+$", black, position=EndPoint);
label(PosCharge3,p);

// label the redistribution of negative charges
triple g(real s) {
    return (cos(s), sin(s), -sqrt(8));
}
path3 n = graph(g, 0, 2*pi, operator ..);
Label NegCharge1 = Label("$-$", black, position=BeginPoint);
label(NegCharge1,n);
Label NegCharge2 = Label("$-$", black, position=MidPoint);
label(NegCharge2,n);
Label NegCharge3 = Label("$-$", black, position=EndPoint);
label(NegCharge3,n);

// draw straight E field lines
real sr = 12;
real[] phi0 = {0, pi/4, pi/2, 3*pi/4, pi, 5*pi/4, 3*pi/2, 7*pi/4};
// real[] phi0 = {0, pi/4, pi/2, pi, 3*pi/2};
for (real phi : phi0)
{
    draw((sr*cos(phi),sr*sin(phi),-5) -- (sr*cos(phi),sr*sin(phi),5), arrow=Arrow3(TeXHead2), black);
}

// draw slightly bent E field lines
real r1 = 8;
real r2 = 4;
real theta1 = 7*pi/9;
real theta2 = 2*pi/9;
real[] phi1 = {pi/4, 3*pi/4, 5*pi/4, 7*pi/4};
for (real phi : phi1)
{
    draw((r1*sin(theta1)*cos(phi),r1*sin(theta1)*sin(phi),r1*cos(theta1)) .. (r1*sin(theta1)*cos(phi),r1*sin(theta1)*sin(phi),r1*cos(theta1)+1) .. (r2*sin(pi/2)*cos(phi),r2*sin(pi/2)*sin(phi),r2*cos(pi/2)) .. (r1*sin(theta2)*cos(phi),r1*sin(theta2)*sin(phi),r1*cos(theta2)-1) .. (r1*sin(theta2)*cos(phi),r1*sin(theta2)*sin(phi),r1*cos(theta2)), arrow=Arrow3(TeXHead2), black);
}


// draw heavily bent E field lines
real r3 = 3.2;
real theta3 = 7*pi/9;
real theta4 = 2*pi/9;
real theta5 = 17*pi/20;
real theta6 = 3*pi/20;
real[] phi2 = {0, pi/2, pi, 3*pi/2};
for (real phi : phi2)
{
    draw((r3*sin(theta3)*cos(phi),r3*sin(theta3)*sin(phi),r3*cos(theta3)-3.5) .. (r3*sin(theta3)*cos(phi),r3*sin(theta3)*sin(phi),r3*cos(theta3)-2.5) .. (3.0*sin(theta3)*cos(phi),3.0*sin(theta3)*sin(phi),3.0*cos(theta3)-1.2) .. (3.0*sin(theta5)*cos(phi),3.0*sin(theta5)*sin(phi),3.0*cos(theta5)), black);
    draw((3.0*sin(theta6)*cos(phi),3.0*sin(theta6)*sin(phi),3.0*cos(theta6)) .. (3.0*sin(theta4)*cos(phi),3.0*sin(theta4)*sin(phi),3.0*cos(theta4)+1.2) .. (r3*sin(theta4)*cos(phi),r3*sin(theta4)*sin(phi),r3*cos(theta4)+2.5) .. (r3*sin(theta4)*cos(phi),r3*sin(theta4)*sin(phi),r3*cos(theta4)+3.5), arrow=Arrow3(TeXHead2), black);
}
