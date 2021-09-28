/// @description Press
if image_index==1
{
	if distance_to_object(ply)<36&&place_meeting(x,y,ply)
	{
		shake(1,1,10);
		var _pNum=7;
		for (var i=0;i<_pNum;i++)
		{
			var _scale=3;
			var _xOff=(i-floor(_pNum/2));
			particle(x+sprite_width/2-_xOff*3,y,depth+1,sPlaceholderPixelB,0,{alpha:1.5,spd:1.5,fade:0.05,dir:90+_xOff*12,xscale: _scale,yscale: _scale});
		}
		playerButtonFeedback(id);
		addDataPair("vrcp",cp);
		var _current=id;
		with oVRCheckpoint if id!=_current image_index=1;
		image_index=0;
		save(global.lastFile);
	}
}
