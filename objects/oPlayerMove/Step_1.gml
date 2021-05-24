/// @description Pathfinding
if !started
{
	pathfindingStart(id,moveCommand);
	started=true;
}
event_inherited();

if !pathfinding instance_destroy();