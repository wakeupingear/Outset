/// @description Fire bullet
projectile(x,y,depth,{
	sprite: sprite_index,
	dir: gunAngle,
	hurtsPlayer: true,
	destroyInd: 2,
	speed: 0
});
shootCount++;
if shootCount<shootNum alarm[4]=24;
else
{
	shootCount=0;
	mode=0.2;
	alarm[3]=20;
}