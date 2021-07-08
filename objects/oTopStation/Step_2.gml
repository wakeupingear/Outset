/// @description Interact
if global.alive&&!holdingTop
{
	if distance_to_object(ply)<40
	{
		mask_index=sTopStationHit;
		if place_meeting(x,y,ply)
		{
			playerButtonFeedback(id);
			holdingTop=true;
			if instance_exists(oTop) instance_destroy(oTop);
			instance_create_layer(x,y+12,"player",oTop);
		}
		mask_index=sTopStation;
	}
}