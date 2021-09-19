import three;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

real viewangle=0.9;
real viewheight=0.2;

currentprojection=perspective((8.0*cos(viewangle*pi/180),8.0*sin(viewangle*pi/180),viewheight), up=Z);

// draw coordinate axis
// draw(-1X -- 4X, arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
// draw(-1Y -- 4Y, arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
// draw(-1Z -- 4Z, arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint, align=N));

// draw plane
real l = 5.0;
draw(surface((l,l,0) -- (l,-l,0) -- (-l,-l,0) -- (-l,l,0) -- cycle), palegray+opacity(0.9));

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

draw((3.4,-3.4,0.2) -- (3.4,-3.4,1.8), black, arrow=Arrow3(TeXHead2), L=Label("$E_{\textrm{top}}^{\perp} = \frac{\sigma}{2\epsilon_o}$", position=EndPoint, align=N));
draw((3.4,-3.4,-0.2) -- (3.4,-3.4,-1.8), black, arrow=Arrow3(TeXHead2), L=Label("$E_{\textrm{bottom}}^{\perp} = \frac{\sigma}{2\epsilon_o}$", position=EndPoint, align=S));
