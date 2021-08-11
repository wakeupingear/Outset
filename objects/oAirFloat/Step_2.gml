/// @description 
if global.alive
{
	vars=oscillate(vars,"y",false,true);
	var _change=round(sin(vars.pos)*amp);
	for (var j=0;j<array_length(layers);j++)
	{
		var _a=layer_get_all_elements(layers[j]);
		for (var i=0;i<array_length(_a);i++)
		{
			if !instance_exists(_a[i]) _a[i]=layer_instance_get_instance(_a[i]);
			moveObj(_a[i],_change);
		}
	}
	
	if instance_exists(ply) with ply 
	{
		//if groundCollision(x,y) show_message(_change)
		//while groundCollision(x,y) y+=sign(_change);
	}
	
	with oHotel floatMove();
	
	for (var i=0;i<array_length(objList);i++)
	{
		if !instance_exists(objList[i]) continue;
		switch objList[i]
		{
			case ply:
			case oAirShip:
				var _move=false;
				with objList[i] if groundCollision(x,y+2) _move=true; 
				if _move moveObj(objList[i],_change);
				break;
			case oGrapple:
				if oGrapple.state>0 moveObj(objList[i],_change);
				break;
			default:
				moveObj(objList[i],_change);
				break;
		}
	}
}