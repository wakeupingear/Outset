/// @description Press
if image_index==1
{
	if distance_to_object(ply)<36&&place_meeting(x,y,ply)
	{
		playerButtonFeedback(id);
		addDataPair("vrcp",cp);
		var _current=id;
		with oVRCheckpoint if id!=_current image_index=1;
		image_index=0;
		save(global.lastFile);
	}
}
