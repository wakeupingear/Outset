event_inherited();

xLerp=0.8;
yOff=-100
yLerp=xLerp;
tileX=true;
tileY=true;

colors=[0,90,180,270];
draw=function(_x,_y){
	
	draw_sprite(sprite_index,image_index,_x,_y);
	draw_sprite_ext(sprite_index,5,_x,_y,1,1,0,-1,0)
	draw_sprite_ext(sprite_index,6,_x,_y,1,1,0,-1,0.25)
	draw_sprite_ext(sprite_index,7,_x,_y,1,1,0,-1,0.5)
	draw_sprite_ext(sprite_index,8,_x,_y,1,1,0,-1,0.7)
	for (i=0;i<array_length(colors);i++)
	{
		var v=135-120*cos(colors[i])
		if v<125 v=125;
		draw_sprite_ext(sprite_index,i+1,_x,_y,1,1,0,merge_color(make_color_rgb(v,v,v),global.scanColor,oTerrain.vrAlpha*0.35),1)
	}
}