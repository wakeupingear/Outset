/// @description Bullet patterns
if !global.menuOpen&&!persistent
{
	if !instance_exists(oParachute)
	{
		alarm[1]=-1;
		alarm[2]=-1;
		conversation("wastes_bulletFail");
	}
}