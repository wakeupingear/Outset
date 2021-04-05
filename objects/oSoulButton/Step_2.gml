/// @description Pressed
if active&&image_index==1&&place_meeting(x,y,ply)
{
	var _p=instance_place(x,y,ply);
	playerButtonFeedback(_p);
	array_push(global.soulButtons,id);
	image_index=0;
	if instance_exists(platform) with platform activateSoulChildren(children);
	if trigger!=-1 trigger();
}