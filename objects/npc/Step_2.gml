/// @description Animation
if global.alive{
if facePlayer&&!pathfinding&&animation.currentAnimation!="attacked"&&instance_exists(ply)
{
	if ply.x>x xscale=1;
	else xscale=-1;
}
npcAnimation();

if array_length(text)>0 diagInteract();
}