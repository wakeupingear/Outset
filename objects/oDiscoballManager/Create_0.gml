/// @description Draw
surf=-1;
colors=[c_red,c_blue,c_yellow,c_green,c_blue,c_purple,c_white];
size=24;
data=array_create(384/size);
for (var i=0;i<384/size;i++)
{
	data[i]=array_create(216/size);
	for (var j=0;j<216/size;j++)
	{
		data[i][j]=colors[irandom(array_length(colors)-1)];
	}
}

draw=function(){
	if !surface_exists(surf) surf=scr_surface_create(384,216);
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	draw_set_alpha(0.5);
	for (var i=0;i<384/size;i++)
	{
		for (var j=0;j<216/size;j++)
		{
			draw_rectangle_color(i*size,j*size,i*size+size-1,j*size+size-1,data[i][j],data[i][j],data[i][j],data[i][j],false);
		}
	}
	draw_set_alpha(1);
	gpu_set_blendmode(bm_subtract);
	with oDiscoball if on
	{
		draw_circle(x-camX(),y-camY(),14,false);
		for (var i=0;i<rayNum;i++)
		{
			draw_sprite_ext(sDiscoballRay,0,x-camX(),y-camY(),1,1,direction+i*360/rayNum,-1,1);
		}
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(surf,camX(),camY());
}