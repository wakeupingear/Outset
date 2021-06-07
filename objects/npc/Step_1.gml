/// @description Pathfinding and physics
var _pfX=pfX;
if _pfX=="x" _pfX=x;
var _pfY=pfY;
if _pfY=="y" _pfY=y;
	
if global.alive{
if pathfinding //process commands
{
	if distance_to_point(_pfX,_pfY)<=pfRad||(pathfindingInterrupt&&!global.menuOpen)||reachedTarget
	{
		teleportOffscreen=false;
		reachedTarget=true;
		move=0;
		//if pathfindingInterrupt pathfindingInterrupt=false;
		if pfWait>0 pfWait--;
		else 
		{
			pfInd++;
			pathfindCommandProcess(moveCommand);
		}
	}
	else
	{
		if pathfindingInterrupt||reachedTarget move=0
		else 
		{
			if x<_pfX move=1;
			else move=-1;
			
			if jumpCheck&&jump==0&&groundCollision(x,y+1)&&!groundCollision(x+move*4,y+6) jump=1;
		}
	}
}

if jump>0
{
	jump++;
	if jump>=jumpHoldTime jump=0;
}

if blockPlayer
{
	if instance_exists(ply) y=ply.y;
	if blockWall==-1
	{
		blockWall=instance_create_depth(x,y,depth+1,hitobj);
		blockWall.sprite_index=sNPCBlockHit;
	}
}
else
{
	physics();
	if pathfinding&&teleportOffscreen&&!isInRange(x,y)&&!isInRange(_pfX,_pfY)
	{
		pfX=_pfX;
		pfY=_pfY;
		while groundCollision(x,y) y--;
	}
	if blockWall!=-1
	{
		instance_destroy(blockWall);
		blockWall=-1;
	}
}

if pathfinding&&!pathfindingInterrupt //get over obstacles
{
	if move!=0&&hsp==0&&vsp==0
	{
		stuckTime++;
		if stuckTime>30
		{
			stuckTime=0;
			jump=1;
		}
	}
	else stuckTime=0;
}
}
else if blockPlayer&&blockWall!=-1
{
	instance_destroy(blockWall);
	blockWall=-1;
}