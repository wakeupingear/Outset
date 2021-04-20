/// @description Press
if image_index==1&&place_meeting(x,y,ply)
{
	image_index=0;
	playerButtonFeedback(instance_place(x,y,ply));
	var _active=true;
	with oReactorButton if image_index==1 _active=false;
	
	if _active
	{
		instance_create_layer(oReactor.x-16,oReactor.y+8,layer,oReactorBeam);
	}
}