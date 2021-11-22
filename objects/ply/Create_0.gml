image_speed=0;
if isDev sprite_index=sPly;
mask_index=sPly;
if object_index==ply&&!global.alive
{
	instance_create_layer(global.plyX,global.plyY,layer,oPlayerSoul);
	instance_destroy();
}

npcMovementVars();
npcAnimVars();
collType=hitobj;

strafe=0;

verticalHitTrigger=function(finalSpd){
	if abs(finalSpd)<1 exit;
	
	if finalSpd>=vspMax
	{
		shake(1,1,15);
		rumbleStart(rumbleType.heavyPulse);
	}
	else if finalSpd>=5.5
	{
		rumbleStart(rumbleType.lightPulse);
	}
	else if finalSpd>2.6
	{
		rumbleStart(rumbleType.lighterPulse);
	}
}

cornerCorrectTrigger=function(){
	rumbleStart(rumbleType.lighterPulse);
}

goingFast=false;
fastIntensity=0;
justLaunched=false;

x=global.plyX;
y=global.plyY;

if !instance_exists(oGrapple)&&hasItem("iGrapple") instance_create_depth(x,y,depth-1,oGrapple);

interactTextLast=-1;
interactTextAlpha=0;

itemFillMax=1;
setItemFill=function(){
	if ds_list_size(global.inventory)>0
	{
		switch (global.inventory[|global.itemSlot])
		{
			default:
				switch (string_letters(global.inventory[|global.itemSlot]))
				{
					case "iLavaSwitch":
					case "iWrench":
						itemFillMax=-1;
						break;
					case "iFormula":
						itemFillMax=60;
						break;
					case "iBeacon":
						itemFillMax=120-100*(isTest||isDev);
						break;
					case "iEgg":
					case "iJet":
					case "iRing":
						itemFillMax=0;
						break;
					default:
						itemFillMax=15;
						break;
				}
				break;
		}
	}
}
setItemFill();

breath=global.maxBreath;
breathAlpha=0;

drawInteract = function(){
	if !option("interactText") exit;
	setFont(fontSizes.small);
	var _yH=8;
	switch global.interactTextObj
	{
		case oElevator: 
			_yH=17;
			break;
		default: break;
	}
	var _xPos=toGuiX(x)-string_width(global.interactTextLabels[interactTextLast])/2;
	var _yPos=toGuiY(y-_yH)-string_height(global.interactTextLabels[interactTextLast]);
	surface_set_target(global.guiSurf);
	draw_set_color(c_white);
	draw_text_outline_transformed_color(_xPos,_yPos,global.interactTextLabels[interactTextLast],c_nearWhite,c_nearWhite,interactTextAlpha,c_nearBlack,c_nearBlack,interactTextAlpha,6*global.guiScale,12,1,1,0);
	//draw_set_alpha(interactTextAlpha);
	//draw_text(_xPos,_yPos,global.interactTextLabels[interactTextLast]);
	//draw_set_alpha(1);
	draw_set_color(c_white);
	surface_reset_target();
	setFont(fontSizes.medium);
}

drawCycle=0;
drawLight=function(){
	if image_alpha!=0
	{
		var _spd=0.01+max(abs(vsp)/2,abs(hsp))*0.005;
		drawCycle=(drawCycle+_spd)%1;
		draw_circle(round(x)-camX(),round(y)-camY(),22+sin(drawCycle*2*pi),false);
	}
}

//animation
animation.onlyAlive=false;
animation.standing={type: animType.loop,startFrame: 10,endFrame:43,frameTime:10};
animation.walking= {frameTime: 7,type: animType.loop,startFrame: 0,endFrame: 1};
animation.ladder={type: animType.singleFrame,startFrame: 5};
animation.ladderMove={frameTime:9, type: animType.loop,startFrame: 5,endFrame: 6};
animation.zipline={type: animType.singleFrame,startFrame: 7};
animation.standingStill={type: animType.singleFrame,startFrame: 0};
animation.jumping.startFrame=4;

newAnimation = new Animation();
//In step event:
image_index=updateAnimation(image_index,newAnimation);

animation.lookingUp={type: animType.singleFrame,startFrame: 3};
animation.lookingDown={type: animType.singleFrame,startFrame: 9};
animation.disappointment={type: animType.singleFrame,startFrame: 44};

stateToAnim[moveState.running]="walking";
stateToAnim[moveState.jumping]="jumping";
stateToAnim[moveState.zipline]="zipline";
stateToAnim[moveState.ladder]="ladder";
stateToAnim[moveState.ladderMove]="ladderMove";

hasBackpack=false;
event_user(0);

lastCoord=ds_stack_create();
reverse=false;

//for jump testing
//jumpStart=y;
//jumpMax=0;