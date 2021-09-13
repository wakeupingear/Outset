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
}

sit=function(){
	rumbleStart(rumbleType.lightPulse);
	ply.state=moveState.floating;
	ply.visible=false;
	ply.xscale=image_xscale;
	ply.x=x;
	ply.y=y;
	image_index=1;
	if object_index=oChairNotdon&&place_meeting(x,y,oNotdonJet) //set chairdata
	{
		var _j=instance_place(x,y,oNotdonJet);
		for (var i=0;i<array_length(_j.chairs);i++){
			if id==_j.chairs[i][0]
			{
				_j.chairData[i][0]=image_index;
				break;
			}
		}
	}
	sitting=true;
	if instance_exists(oCamera) oCamera.followObj=id;
}

eject=function(){
	if !global.menuOpen oCamera.followObj=oPlayerCam;
	ply.visible=true;
	sitting=false;
	image_index=0;
	with ply while groundCollision(x,y) y--;
}