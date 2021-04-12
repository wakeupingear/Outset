/// @description touch player
if instance_exists(ply)&&distance_to_object(ply)<16&&place_meeting(x,y,ply)
{
	conversation(["$addItem",[item,"text"]]);
	instance_destroy();
}