/// @description 
if global.alive
{
	vars=oscillate(vars,"y",false,true);
	var _change=round(sin(vars.pos)*amp);
	for (var j=0;j<array_length(layers);j++)
	{
		var _a=layer_get_all_elements(layers[j]);
		if j==0
		{
			if instance_exists(ply) with ply if groundCollision(x,y+1) array_push(_a,id);
			if instance_exists(oAirShip) with oAirShip if groundCollision(x,y+1) array_push(_a,id);
			if instance_exists(oGrapple) with oGrapple if state>0 array_push(_a,id);
		}
		for (var i=0;i<array_length(_a);i++)
		{
			if !instance_exists(_a[i]) _a[i]=layer_instance_get_instance(_a[i]);
			_a[i].y+=_change;
		}
	}
	
	if instance_exists(ply) with ply 
	{
		//if groundCollision(x,y) show_message(_change)
		//while groundCollision(x,y) y+=sign(_change);
	}
}