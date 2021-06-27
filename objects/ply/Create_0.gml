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

x=global.plyX;
y=global.plyY;

if !instance_exists(oGrapple) instance_create_depth(x,y,depth-1,oGrapple);

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
	draw_set_alpha(interactTextAlpha);
	draw_text(_xPos,_yPos,global.interactTextLabels[interactTextLast]);
	draw_set_alpha(1);
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