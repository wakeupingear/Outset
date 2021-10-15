image_speed=0;
image_alpha=0;
alarm[0]=1;

xOff=0;
xShift=0
yOff=0;
yShift=0;
letter="";

hover=false;
selected=false;
active=true;

letterClicked=function(){
	with oLetter selected=false;
	selected=true;
	particle(x,y,depth+1,sprite_index,0,{
		xscaleSpd:0.05,
		yscaleSpd:0.05,
		fade:0.05
	});
}