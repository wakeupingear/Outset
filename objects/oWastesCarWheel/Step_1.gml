/// @description Hit enemies
if global.alive{
if (x!=xprevious||y!=yprevious)&&place_meeting(x,y,enem)
{
	var _e=instance_place(x,y,enem);
	hurtEnem(_e,1);
	if _e.myHealth<=0 shake(1,1,15);
}
}