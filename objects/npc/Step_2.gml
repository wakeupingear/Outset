/// @description Animation
if global.alive{
if facePlayer&&!pathfinding&&animation.currentAnimation!="attacked"&&instance_exists(ply)
{
	if ply.x>x xscale=1;
	else xscale=-1;
}

if array_length(text)>0&&animation.currentAnimation!="attacked" diagInteract(text);
}
else {
if array_length(deadText)>0 diagInteract(deadText);
}

npcAnimation(); //alive is checked inside animation