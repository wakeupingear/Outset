/// @description Pressed
if global.alive&&active&&place_meeting(x,y,oPhysicsObj)
{
	var _p=instance_place(x,y,oPhysicsObj);
	playerButtonFeedback(_p);
	if next!=-1
	{
		with next
		{
			active=true;
			image_index=1;
		}
	}
	else
	{
		if global.notdonEra==notdonEras.pro2 conversation("pro_electroFix");
	}
	image_index=2;
	active=false;
}