/// @description Interact
if global.alive&&!holdingTop
{
	if distance_to_object(ply)<40&&ply.y<y&&place_meeting(x,y-1,ply)
	{
		playerButtonFeedback(id);
		holdingTop=true;
		if instance_exists(oTop) instance_destroy(oTop);
		instance_create_layer(x,y+20,"player",oTop);
	}
}