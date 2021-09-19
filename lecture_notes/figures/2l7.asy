import three;
// import solids;
import graph3;

size(6cm,0);

defaultpen(fontsize(10pt));

currentprojection=perspective((8.0*cos(30*pi/180),8.0*sin(30*pi/180),5), up=Z);

// draw coordinate axis
// draw(-1X -- 4X, arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
// draw(-1Y -- 4Y, arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
// draw(-1Z -- 4Z, arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint, align=N));

real[] uu = {-4, -2, 0, 2, 4};
real[] vv = {-4, -2, 0, 2, 4};

for (real u : uu)
{
    for (real v : vv)
    {
        draw((u,v,-2) -- (u,v,2), black, arrow=Arrow3(TeXHead2));
    }
}

// draw surface
draw(surface((-5,-5,-1.2) -- (-5,5,1.2) -- (5,5,1.2) -- (5,-5,-1.2) -- cycle), palegray+opacity(0.5));
