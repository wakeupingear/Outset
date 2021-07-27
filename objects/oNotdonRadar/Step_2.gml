/// @description Absorb + animation
if place_meeting(x,y,oParticle)
{
	var _p=instance_place(x,y,oParticle);
	if _p.sprite_index==sRadioWave
	{
		if oCamera.followObj==_p //c1 cutscene
		{
			oCamera.followObj=id;
		}
		instance_destroy(_p);
	}
}