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

// draw loop
real zheight = 0.8; // ackchually height of extent of z
real ylength = 2.0; // ackchually height of extent of z
draw((0,-ylength,-zheight) -- (0,-ylength,zheight) -- (0,ylength,zheight) -- (0,ylength,-zheight) -- cycle, black+linewidth(0.3mm));

// draw E parallel
draw((0,-ylength,zheight) -- (0,ylength/2,zheight), arrow=Arrow3(TeXHead2), black+linewidth(0.3mm), L=Label("$E_{\textrm{top}}^{\parallel}$", black, position=EndPoint, align=N));
draw((0,-ylength,-zheight) -- (0,ylength/2,-zheight), arrow=Arrow3(TeXHead2), black+linewidth(0.3mm), L=Label("$E_{\textrm{bottom}}^{\parallel}$", black, position=EndPoint, align=S));
