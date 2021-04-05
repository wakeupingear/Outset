/// @description Create souldrop
var _surf=surface_create(sprite_width,sprite_height);
surface_set_target(_surf);
draw_sprite(sprite_index,image_index,0,0);
surface_reset_target();
var _buf=buffer_create(sprite_width*sprite_height,buffer_grow,1);
buffer_get_surface(_buf,_surf,0);
var _positions=[];
for (var i=0;i<sprite_width*sprite_height*4;i+=4)
{
	if buffer_peek(_buf,i,buffer_u32)==global.coinColorPoint
	{
		array_push(_positions,(i/4) mod sprite_height, (i/4) div sprite_height);
	}	
}

if instance_exists(ply) var _depth=ply.depth+1;
else var _depth=400;

var _ind=image_index;
with object_index 
{
	if image_index==_ind 
	{
		for (var i=0;i<array_length(_positions)/2;i++)
		{
			var _s=instance_create_depth(x+_positions[i*2],y+_positions[i*2+1],depth,oSouldropCoin);
			_s.cID=int64(string(id)+string(i));
		}
		instance_destroy();
	}
}

surface_free(_surf);