image_speed=0;

moving=false;
arrived=true;
position=0;
dir=1;
vertical=false;

points=ds_list_create();
alarm[1]=1;

addPoint=function(_x,_y,stop){
	if is_undefined(stop) stop=false;
	ds_list_add(points,[_x,_y,stop]);
}

setPlayerTrack=function(override){
	if !movingPlayer exit;
	if x==points[|position][0]&&(is_undefined(override)||override)
	{
		vertical=true;
		ply.image_alpha=0;
		ply.state=moveState.floating;
	}
	else
	{
		vertical=false;
		ply.image_alpha=1;
		ply.state=moveState.standing;
	}
}

setXscale=function(){
	if !movingPlayer exit;
	var _xOff=x-ply.x;
	var _xTo=points[|position][0];
	if _xTo!=x&&image_xscale!=sign(_xTo-x)
	{
		image_xscale=sign(_xTo-x);
		if _xOff!=0&&instance_exists(ply)
		{
			ply.x=x+_xOff;
			ply.xscale=image_xscale;
		}
	}
}
spd=2;