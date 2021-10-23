image_alpha=0;
image_blend=global.hudColorList[global.hudColor];

inputs=[];

destroy=false;
selected=false;
selectedSlide=0;
parent=-1;
pos=-1;
text="";
textWidth=0;
mode=0; //keyboard
controllerScreenOff=0;

draw=function(_x,_y){ //parameters not necessary
	y=ystart-(1-image_alpha)*256;
	if mode==0
	{
		x=xstart;
	}
	else 
	{
		if pos>floor(global.numOfInputs/2)-1 x=384-controllerScreenOff-12-selectedSlide;
		else x=controllerScreenOff+12+selectedSlide;
	}
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*global.hudAlpha);
}