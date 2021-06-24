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
	
	if object_index!=ply&&object_index!=oPlayerSoul
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
	collPointX=[0] //collision x coordinate - default is a single point right below the player
	collPointY=[8] //collision y
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

function npcAnimVars(){
	animation={
		standing: {type: animType.singleFrame,startFrame: 0},
		jumping: {type: animType.singleFrame,startFrame: 3},
		attacked: {type: animType.singleFrame,startFrame: 2},
		walking: {
			frameTime: 7,
			type: animType.loop,
			startFrame: 0,
			endFrame: 1
		}
		/* example: {
			frameTime: 15,
			type: animType.loop,
			startFrame: 2,
			endFrame: 4
		}*/
	}
	
	currentAnimation="standing"; //currently active animation
	animCount=0; //progress in the animation
	animDir=1; //direction of frame progression
	animating=true; //whether a non-default animation is set
	stateToAnim=array_create(20,"standing"); //array mapping state to animation name
}

function npcAnimation(){
	setStateAnimation();
	if animating {
	switch (animation[$ currentAnimation].type)
	{
		case animType.singleFrame: 
			image_index=animation[$ currentAnimation].startFrame; 
			animating=false;
			break;
		case animType.oneOff:
		case animType.loop:
			animCount++
			if animCount>animation[$ currentAnimation].frameTime
			{
				animCount=0;
				image_index++;
				if image_index>animation[$ currentAnimation].endFrame 
				{
					image_index=animation[$ currentAnimation].startFrame;
					animating = (animation[$ currentAnimation].type!=animType.oneOff);
				}
			}
			break;
		case animType.pingPong:
			animCount++
			if animCount>animation[$ currentAnimation].frameTime
			{
				animCount=0;
				image_index+=animDir;
				if image_index==animation[$ currentAnimation].endFrame||image_index==animation[$ currentAnimation].endFrame animDir*=-1
			}
			break;
	}
	}
}

function npcHealthVars(){
	myHealth=1;
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