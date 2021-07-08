function npcMovementVars(){
	physicsVars();
	jumpSpd=2; //initial jump speed
	jumpAdd=0; //additional jump speed (set by platforms, other objects that give you momentum)
	jumpHoldTime=20; //max jump hold button time
	move=0; //move command: -1=left, 0=stationary, 1=right
	jump=0; //jump command: number between 1 and jumpHoldTime
	canMove=true;
	
	coyoteMax=8; //coyote time
	coyote=coyoteMax; //current coyote time
	
	if object_is_ancestor(object_index,npc)
	{	
		pathfinding=false; //whether pathfinding is active
		pathfindingInterrupt=false; //pathfinding can be interrupted by cutscenes
		pfX=0; //x coordinate to pathfind towards
		pfY=0; //y coordinate
		pfRad=0; //radius to get within pathfinding coordinates
		pfWait=0; //delay between pathfinding commands
		pfInd=0; //current command
		moveCommand=-1; //array of pathfinding commands
		stuckTime=0; //counts how long the object has been moving towards a point without actually going anywhere
		reachedTarget=true; //whether the object has reached its last pathfinding coordinate
		jumpCheck=false; //whether the object should check for holes to jump over
		teleportOffscreen=false; //teleport to position when offscreen
		
		blockPlayer=false;
		blockWall=-1;
		
		if object_is_ancestor(object_index,enem)
		{
			xscale=1; //scale vars are set in positionNPC() for npcs
			yscale=1;
			if object_is_ancestor(object_index,enem)
			{
				enemActive=true;
			}
		}
	}
	else
	{
		xscale=1; //scale vars are set in positionNPC() for npcs
		yscale=1;
	}
}

function physicsVars(){
	hsp=0; //horizontal speed
	hspMax=1.2; //max horizontal speed
	hspAcc=0.6; //perframe horizontal acceleration
	vsp=0; //vertical speed
	vspMax=8; //max vertical speed
	collType=npcHit; //type of collision to interact with
	collPointX=[0]; //collision x coordinate - default is a single point right below the player
	collPointY=[8]; //collision y
	if !is_undefined(global.physCollPoints[?sprite_get_name(sprite_index)]) //import the sprite's coordinates if it exists
	{
		collPointX=global.physCollPoints[?sprite_get_name(sprite_index)][0];
		collPointY=global.physCollPoints[?sprite_get_name(sprite_index)][1];
	}
	
	state=moveState.falling; //physics state
	if groundCollision(x,y+1) state=moveState.standing; //set default state
	lastState=-1; //holds previous state
	
	veltime=0; //current progress in horizontal acceleration/deceleration
	accTime=4; //acceleration threshold - compare veltime against this
	decTime=2; //deceleration threshold
	
	maxYChange=3; //the highest slope that the object can go up
}

function Animation() constructor{ 
	currentAnimation= "standing"; //currently active animation
	animCount= 0; //progress in the animation
	animDir= 1; //direction of frame progression
	animating= true; //whether a non-default animation is set
	standing= {type: animType.singleFrame,startFrame: 0};
}
function setAnimation(currentAnimation,animation){
	animation.animating=true;
	animation.currentAnimation=currentAnimation;
	animation.animCount=0;
	return animation[$ currentAnimation].startFrame;
}
function updateAnimation(index,animation){
	if animation.animating {
	switch (animation[$ animation.currentAnimation].type)
	{
		case animType.singleFrame: 
			index=animation[$ animation.currentAnimation].startFrame; 
			animation.animating=false;
			break;
		case animType.oneOff:
		case animType.loop:
			animation.animCount++;
			if animation.animCount>animation[$ animation.currentAnimation].frameTime
			{
				var _dir=sign(animation[$ animation.currentAnimation].endFrame-animation[$ animation.currentAnimation].startFrame);
				animation.animCount=0;
				index+=_dir;
				var _repeats=(animation[$ animation.currentAnimation].type!=animType.oneOff);
				if ((_dir==1&&index>animation[$ animation.currentAnimation].endFrame)||(_dir==-1&&index<animation[$ animation.currentAnimation].endFrame))
				{
					if !_repeats 
					{
						animation.animating=false;
						index-=_dir;
					}
					else index=animation[$ animation.currentAnimation].startFrame;
				}
				
			}
			break;
		case animType.pingPong:
			animation.animCount++;
			if animation.animCount>animation[$ animation.currentAnimation].frameTime
			{
				animation.animCount=0;
				index+=animation.animDir;
				if index==animation[$ animation.currentAnimation].startFrame||index==animation[$ animation.currentAnimation].endFrame 
				{
					animation.animDir*=-1;
				}
			}
			break;
	}
	}
	return index;
}

function npcAnimVars(){
	animation=new Animation();
	animation.jumping= {type: animType.singleFrame,startFrame: 3};
	animation.attacked= {type: animType.singleFrame,startFrame: 2};
	animation.walking= {
		frameTime: 7,
		type: animType.loop,
		startFrame: 0,
		endFrame: 1
	};
	
	stateToAnim=array_create(20,"standing"); //array mapping state to animation name
}

function npcAnimation(){
	setStateAnimation(false);
	image_index=updateAnimation(image_index,animation);
}

function npcHealthVars(){
	myHealth=1;
	damage=1;
}

function npcGetStartX(npcKey){
	return global.characterLocations[? npcKey][0];
}
function npcGetStartY(npcKey){
	return global.characterLocations[? npcKey][1];
}
function npcGetLocation(npcKey){
	return room_get_name(global.characterLocations[? npcKey][2])+"."+global.characterLocations[? npcKey][4];
}
function npcGetRoom(npcKey){
	return global.characterLocations[? npcKey][2];
}