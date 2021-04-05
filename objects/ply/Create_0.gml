if object_index==ply&&!global.alive
{
	instance_create_layer(global.plyX,global.plyY,layer,oPlayerSoul);
	instance_destroy();
}

npcMovementVars();
npcAnimVars();

x=global.plyX;
y=global.plyY;

if !instance_exists(oGrapple) instance_create_depth(x,y,depth-1,oGrapple);

interactTextLast=-1;
interactTextAlpha=0;

drawInteract = function(){
	setFont(fontSizes.small);
	var _xPos=(x-camX())*guiX()-string_width(global.interactTextLabels[interactTextLast])/2;
	var _yPos=(y-camY()-7)*guiY()-string_height(global.interactTextLabels[interactTextLast]);
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


//for jump testing
//jumpStart=y;
//jumpMax=0;