image_speed=0;
image_alpha=0.1;
mask_index=sPly;

text=[];
mode=0;
diag=0;
textboxTime=0; //track duration

padding=5; //border padding
textX=54; //text starting x
textY=17; //text starting y
leftShift=0; //text offset on the left side
rightShift=0; //right text offset

wait=false; //whether the wait timer (alarm[0]) is active
whileCondition="";
whileArgs=[];
skip=false; //whether the text automatically skips
saved=false;

character="";
characterFirstLetterUpper="";
sentence="";
sentenceFormatted=false;
textInd=0;
top=true;

boxHidden=false; //used for things like popups
portInd=0;
lastName="";
nameAlpha=1;
barAlpha=(global.roomTime<4);

question=false;
questionNum=0;
questionChoice=0;

portOverride=false;
fontOverride=false;

charWaitList=[];
commaWait=11;
periodwait=18;
exclamationWait=15;
questionmarkWait=15;

trackObj=-1;
mustTouch=true; //inputs not reliant on touching the object
thisCameraChanged=false;

lastObj=-2;

setCharacterDiag = function(){
	characterFirstLetterUpper=string_upper(string_char_at(character,1))+string_copy(character,2,string_length(character)-1);
	resetCharacterTestVars();
	if character!=""
	{
		if !fontOverride
		{
			diagColor=global.characters[$ character].diagColor;
			portName=string_upper(global.characterNames[global.characterLocations[? character][3]]);
			font=global.characters[$ character].font;
			if portName!=lastName
			{
				alarm[1]=-1;
				alarm[2]=1;
			}
		}
		if !portOverride setPortPositions(global.characters[$ character].portrait);
	}
}

setPortPositions=function(portArray){
	for (var i=0;i<array_length(portArray);i++)
	{
		if portArray[i]==empty continue;
		var _npcName=string_replace(sprite_get_name(portArray[i]),"port","");
		if instance_exists(asset_get_index("npc"+_npcName))
		{
			var _obj=instance_find(asset_get_index("npc"+_npcName),0);
			if _obj.x>camX()+192 array_push(portRight,portArray[i]);
			else array_push(portLeft,portArray[i]);
		}
		else array_push(portLeft,portArray[i]);
	}
}

setHeight=function(){
	if !global.menuOpen exit;
	characterFirstLetterUpper=string_upper(string_char_at(character,1))+string_copy(character,2,string_length(character)-1);
	if character=="" top=(instance_exists(ply)&&ply.y>camY()+108);
	else
	{
		if instance_exists(asset_get_index("npc"+characterFirstLetterUpper))
		{
			var _obj=instance_find(asset_get_index("npc"+characterFirstLetterUpper),0);
			top= (_obj.y>camY()+108);
		}
	}
}

resetCharacterTestVars=function(){
	portName="";
	if !fontOverride
	{
		diagColor=c_nearWhite;
		font=fontSizes.medium;
	}
	if !portOverride
	{
		portLeft=[];
		portRight=[];
	}
}

resetCharacterTestVars();

portYOff=4;
draw=function(edgeX,edgeY){
	x=edgeX+(1-image_alpha)*64*(!global.hudSide-global.hudSide);
	y=edgeY+132*(!top);

	leftShift=0;
	rightShift=0;

	//bars
	if instance_exists(oVRBluescreen)||instance_exists(oVRXPError) barAlpha=0;
	else if instance_exists(oPopup)||mode<0
	{
		if barAlpha>0 barAlpha-=0.1;
	}
	else
	{
		if barAlpha<1 barAlpha+=0.1;
	}
	draw_sprite_ext(sTextbox,2,edgeX,edgeY+round((1-barAlpha)*48),1,1,0,c_nearBlack,global.hudAlpha);
	draw_sprite_ext(sTextbox,2,edgeX,edgeY-251+round(barAlpha*48),1,1,0,c_nearBlack,global.hudAlpha);

	if sprite_index==sTextbox
	{
		draw_sprite_ext(sprite_index,0,x,y,1,1,0,global.hudColorList[global.hudColor],image_alpha*global.hudAlpha);
		draw_sprite_ext(sprite_index,1,x,y,1,1,0,-1,image_alpha);
	}

	if !boxHidden
	{
		for (var i=0;i<array_length(portLeft);i++)
		{
			draw_sprite_ext(portLeft[i],portInd,x+16+textX+leftShift*i,y+textY+16+portYOff,1,1,0,-1,image_alpha)
			leftShift+=(32+padding);
		}
		for (var i=0;i<array_length(portRight);i++)
		{
			draw_sprite_ext(portRight[i],portInd,x+384-(16+textX+rightShift*i),y+textY+16+portYOff,1,1,0,-1,image_alpha)
			rightShift+=(32+padding);
		}
	}
}