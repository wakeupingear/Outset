image_speed=0;
image_index=4;

myHealth=-1;
name="YEEEEEET";
location="ur mom";
file=0;
playtime=0;
playtimeFormat="";

selected=false;

draw=function(){
	draw_sprite_ext(sprite_index,image_index,x-camX(),y-camY(),1,1,0,image_blend,image_alpha);
}

drawGUI=function(){
	if playtimeFormat==""
	{
		playtimeFormat=string(playtime);
	}
	draw_text(toGuiX(x-64),toGuiY(y-68),name+" - "+playtimeFormat);
}