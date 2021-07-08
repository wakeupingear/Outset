event_inherited();

if hasData("wBorderDoor") instance_destroy(false);
else
{
	key="wastes_borderDoor";
	hit=createCollisionMask();
	hit.x-=14;
}