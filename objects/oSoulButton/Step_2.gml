/// @description Pressed
if active&&image_index==1&&place_meeting(x,y,ply)
{
	playerButtonFeedback(instance_place(x,y,ply));
	array_push(global.soulButtons,id);
	image_index=0;
	if instance_exists(platform) with platform activateSoulChildren(children);
	if trigger!=-1 trigger();
}