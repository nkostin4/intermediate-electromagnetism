import three;
import labelpath3;
import graph3;

defaultpen(fontsize(8pt));

size(6cm,0);

currentprojection=perspective((8.0*cos(-16*pi/180)+8,8.0*sin(-16*pi/180)+8,6), up=Z);

// draw coordinate axis
draw(-1X -- 4X, arrow=Arrow3(TeXHead2), L=Label("$x$", position=EndPoint));
draw(-1Y -- 4Y, arrow=Arrow3(TeXHead2), L=Label("$y$", position=EndPoint));
draw(-1Z -- 4Z, arrow=Arrow3(TeXHead2), L=Label("$z$", position=EndPoint, align=N));

// draw plane
real l = 5.0;
draw(surface((5*l,5*l,0) -- (5*l,-l,0) -- (-l,-l,0) -- (-l,5*l,0) -- cycle), palegray+opacity(0.5));

// draw E?
real mag = 3.0;
draw((11,11,0) -- (18,11,0), black, arrow=Arrow3(), L=Label("$\vec{E}$?", black, position=EndPoint, align=NE));
