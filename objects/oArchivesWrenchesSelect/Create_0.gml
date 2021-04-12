image_speed=0

wrenches=[];
for (var i=1;i<image_number;i++) wrenches[i-1]=hasData("wr"+string(i));

selection=-1;
parentObj=-1;
draw=function(){
	for (var i=1;i<image_number;i++)
	{
		if wrenches[i-1] draw_sprite_ext(sprite_index,i,x,y,image_xscale,image_yscale,image_angle,c_black,image_alpha*0.3);
		else draw_sprite_ext(sprite_index,i,x,y,image_xscale,image_yscale,image_angle,merge_color(c_white,c_orange,0.5*(selection==i)),image_alpha);
	}
}