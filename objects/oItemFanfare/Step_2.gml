/// @description Animation
if instance_exists(ply){
	x=ply.x;
	y=ply.y-16;
}

if mode==1{
	if prog<1 prog+=0.1;
}
else {
	if prog>0 prog-=0.05;
	else instance_destroy();
}
image_alpha=twerp(TwerpType.inout_cubic,0,1,prog);
direction=(direction+image_alpha*0.75)%360;

innerProg=(innerProg+image_alpha*0.02)%(pi);
innerAng=(innerAng+sin(innerProg)+0.5)%360;
//destroyed by text box