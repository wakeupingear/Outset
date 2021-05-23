event_inherited();
image_blend=c_soulBlue;
draw=-1;
spd=0;

drawLight=function(){
	draw_circle(x-camX(),y-camY(),floor(image_xscale*48)+4,false);
}