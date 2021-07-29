image_speed=0;

check=9;
text=-1;
sitting=false;

var _state=hasData("chair"+string(x)+string(y));
if _state!=false
{
	image_index=_state;
	switch object_index
	{
		case oChairNotdon:
			switch image_index
			{
				case 2:
					text="chairTest";
					break;
				default: break;
			}
			break;
		default: break;
	}
	if text!=-1&&check==9 check=1;
}

eject=function(){
	if !global.menuOpen oCamera.followObj=oPlayerCam;
	ply.visible=true;
	sitting=false;
	image_index=0;
	with ply while groundCollision(x,y) y--;
}