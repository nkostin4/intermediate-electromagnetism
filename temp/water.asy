import three;

currentprojection=perspective(26*(0,1,-1), up=X);

defaultpen(fontsize(1pt));

surface hydrogen = scale3(12)*unitsphere;
surface oxygen = scale3(15.2)*unitsphere;

real bond = 9.6;

real alpha = 120;

triple o = (0,0,0);
triple h1 = o + X*bond;
triple h2 = rotate(alpha, O, Z)*h1;

draw(shift(o)*oxygen, red);
draw(shift(h1)*hydrogen, white);
draw(shift(h2)*hydrogen, white);

draw(O -- rotate(alpha/2, O, Z)*3h1, arrow=ArcArrow3(), L=Label("$\vec{p}$", position=EndPoint));