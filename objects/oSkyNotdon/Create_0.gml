event_inherited();

time=0;
vShipTime=0.5*instance_exists(oVShip);
draw=function(_x,_y){
	if global.timeOfDay==times.night
	{
		var _width=42;
		var _num=5;
		if global.alive time=(time+0.005) mod 1;
		for (var i=-_num;i<_num+1;i++)
		{
			var _xPos=_width*i+(time*_width);
			draw_sprite(sStarfield,0,camX()+192+_xPos,camY()-130+sqr(_xPos)/200);
		}
	}
	
	if global.alive
	{
		if instance_exists(oVShip)
		{
			if vShipTime<1
			{
				vShipTime+=0.0125;
			}
		}
		else if vShipTime>0 vShipTime-=0.05;
	}
	
	draw_sprite_ext(sprite_index,global.timeOfDay,_x,_y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	if vShipTime>0  
	{
		draw_sprite_ext(sprite_index,2,_x,_y,image_xscale,image_yscale,image_angle,image_blend,twerp(TwerpType.in_expo,0,0.75,vShipTime));
	}
}