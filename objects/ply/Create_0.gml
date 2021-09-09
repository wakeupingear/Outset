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
	setFont(fontSizes.small);
	var _xPos=toGuiX(x)-string_width(global.interactTextLabels[interactTextLast])/2;
	var _yPos=toGuiY(y-8)-string_height(global.interactTextLabels[interactTextLast]);
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

drawLight=function(){
	if image_alpha!=0 draw_circle(round(x)-camX(),round(y)-camY(),24,false);
}

//animation
animation.ladder={type: animType.singleFrame,startFrame: 16};
animation.ladderMove={frameTime:9, type: animType.loop,startFrame: 16,endFrame: 17};
animation.zipline={type: animType.singleFrame,startFrame: 18};
animation.jumping.startFrame=13;

animation.lookingUp={type: animType.singleFrame,startFrame: 14};
animation.lookingDown={type: animType.singleFrame,startFrame: 12};

stateToAnim[moveState.running]="walking";
stateToAnim[moveState.jumping]="jumping";
stateToAnim[moveState.zipline]="zipline";
stateToAnim[moveState.ladder]="ladder";
stateToAnim[moveState.ladderMove]="ladderMove";

hasBackpack=false;
event_user(0);

//for jump testing
//jumpStart=y;
//jumpMax=0;