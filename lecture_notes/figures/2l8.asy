import three;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

real viewangle=-29.0;
real viewheight=4.0;

currentprojection=perspective((8.0*cos(viewangle*pi/180),8.0*sin(viewangle*pi/180),viewheight), up=Z);

// draw coordinate axis
// draw(-1X -- 4X, arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
// draw(-1Y -- 4Y, arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
// draw(-1Z -- 4Z, arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint, align=N));

// draw plane
real l = 5.0;
draw(surface((l,l,0) -- (l,-l,0) -- (-l,-l,0) -- (-l,l,0) -- cycle), palegray+opacity(0.9));

// draw cylindrical Gaussian surface
real rg = 1.6; // radius
real height = 0.8; // this is ackchually half of the height
real gaussianopacity = 0.4;
surface gaussian = extrude(circle(c=(0,0,-height), r=rg, normal=Z), axis=2*height*Z);
draw(gaussian, surfacepen=white+opacity(gaussianopacity)); // ackchually draws the cylinder
draw(surface(circle(c=(0,0,height), r=rg, normal=Z)), surfacepen=white+opacity(gaussianopacity));
draw(circle(c=(0,0,height), r=rg, normal=Z), black);
draw(surface(circle(c=(0,0,-height), r=rg, normal=Z)), surfacepen=white+opacity(gaussianopacity));
draw(circle(c=(0,0,-height), r=rg, normal=Z), black);
draw(circle(c=(0,0,0), r=rg, normal=Z), black+dashed);

// draw electric field
real[] uu = {-3.4, 0, 3.4};
real[] vv = {-3.4, 0, 3.4};

for (real u : uu)
{
    for (real v : vv)
    {
        draw((u,v,0.2) -- (u,v,1.8), black, arrow=Arrow3(TeXHead2));
        draw((u,v,-0.2) -- (u,v,-1.8), black, arrow=Arrow3(TeXHead2));
    }
}
draw((3.4,3.4,0.2) -- (3.4,3.4,1.8), arrow=Arrow3(TeXHead2), L=Label("$\vec{E}$", position=EndPoint, align=N));
