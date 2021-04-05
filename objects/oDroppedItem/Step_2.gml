/// @description touch player
if instance_exists(ply)&&distance_to_object(ply)<16&&place_meeting(x,y,ply)
{
	var _arr=["$addItem",[item,"text"]];
	conversation(_arr);
	instance_destroy();
}