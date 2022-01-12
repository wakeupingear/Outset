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
newLetterInd=0;
newLetterX=0;
newLetterY=0;
textUpdated=false;

enum textState{
	normal,
	vibrate,
	bold,
	boldVibrate
}
letterStates=[];

boxHidden=false; //used for things like popups
portInd=0;
portProg=0;
lastName="";
nameAlpha=1;
barAlpha=(global.roomTime<4);

question=false;
questionNum=0;
questionChoice=0;
lastQuestionChoice=0;

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
	else portProg=-0.01;
}

createPort=function(_x,_y,spr,ind,_map){
	if ds_map_exists(_map,spr){
		var _p=_map[? spr];
		_p.image_index=ind;
		_p.alarm[1]=1;
		_p.active=true;
		exit;
	}
	var _p=instance_create_depth(_x,_y,depth,oPortrait);
	_p.parent=id;
	_p.sprite_index=spr;
	_p.image_index=ind;
}
setPortPositions=function(portArray){
	if mode==-1 exit;
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
	
	leftShift=0;
	rightShift=0;
	var _map=ds_map_create();
	var _id=id;
	with oPortrait {
		if parent==_id {
			active=false;
			ds_map_add(_map,sprite_index,id);
		}
	}
	for (var i=0;i<array_length(portLeft);i++)
	{
		createPort(16+textX+leftShift*i,textY+16+portYOff,portLeft[i],portInd,_map);
		leftShift+=(32+padding); //assumes that portraits stay on the same side of the screen
	}
	for (var i=0;i<array_length(portRight);i++)
	{
		createPort(384-(16+textX+rightShift*i),textY+16+portYOff,portRight[i],portInd,_map);
		rightShift+=(32+padding);
	}
	with oPortrait if !active&&parent==_id alarm[0]=1;
	ds_map_destroy(_map);
}

heightOverride=0;
setHeight=function(){
	if !global.menuOpen exit;
	if heightOverride!=0
	{
		if heightOverride==1 top=true;
		else top=false;
		heightOverride=0;
		exit;
	}
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

confirmIcon=noone;

resetCharacterTestVars();

portYOff=4;
barPos=0;
blackBars=true;
drawIcon=function(_x,_xS,_y,_yS){
	if !question with confirmIcon draw_sprite_ext(sprite_index,image_index,(oTextbox.x+324+_x)*_xS,(oTextbox.y+60+_y)*_yS,image_xscale*_xS,image_yscale*_yS,image_angle,image_blend,image_alpha);
	else 
	{
		with confirmIcon draw_sprite_ext(sprite_index,image_index,(oTextbox.x+48+x+_x)*_xS,(oTextbox.y+26+round(oTextbox.newLetterY/guiY())+_y)*_yS,image_xscale*_xS,image_yscale*(1+(xprevious!=x)*sqrt(abs(xprevious-x)*0.1))*_yS,image_angle,image_blend,image_alpha);
	}
}
draw=function(edgeX,edgeY){
	x=edgeX+(1-image_alpha)*64*(!global.hudSide-global.hudSide);
	y=edgeY+132*(!top);

	//bars
	if instance_exists(oVRBluescreen)||instance_exists(oVRXPError)||!option("blackBars") barAlpha=0;
	else if instance_exists(oPopup)||mode<0||!blackBars
	{
		if barAlpha>0 barAlpha-=0.1;
		if barPos>0 barPos-=0.1;
	}
	else
	{
		if barAlpha<1 barAlpha+=0.1;
		else barPos=(barPos+0.005)%1;
	}
	draw_sprite_ext(sTextbox,2,edgeX,edgeY+6+round((1-barAlpha)*48)-sin(barPos*2*pi)*3,1,1,0,c_nearBlack,global.hudAlpha);
	draw_sprite_ext(sTextbox,2,edgeX,edgeY-251+round(barAlpha*48)+sin(barPos*2*pi)*3,1,1,0,c_nearBlack,global.hudAlpha);

	if sprite_index==sTextbox&&global.lightAlpha==0
	{
		draw_sprite_ext(sprite_index,0,x,y,1,1,0,global.hudColorList[global.hudColor],image_alpha*global.hudAlpha);
		draw_sprite_ext(sprite_index,1,x,y,1,1,0,-1,image_alpha);
	}
	
	//portraits
	var _id=id;
	with oPortrait if parent==_id draw_sprite_ext(sprite_index,image_index,parent.x+x,parent.y+y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*oTextbox.image_alpha);
	
	if instance_exists(confirmIcon) 
	{
		if question
		{
			if lastQuestionChoice!=questionChoice
			{
				lastQuestionChoice=questionChoice;
				animateProperty(confirmIcon,"x",TwerpType.out_quad,confirmIcon.x,textboxQuestionX[questionChoice],0.075,false);
				for (var i=0;i<array_length(textboxQuestionLetters[!questionChoice]);i++) textboxQuestionLetters[!questionChoice][i].letterState=textState.normal;
				for (var i=0;i<array_length(textboxQuestionLetters[questionChoice]);i++) textboxQuestionLetters[questionChoice][i].letterState=textState.bold;
			}
		}
		drawIcon(0,1,0,1);
	}
}

textboxQuestionData=textLoad("textbox_question");
textboxQuestionX=array_create(2,0);
textboxQuestionLetters=[[],[]];
createLetter=function(letter,letterState){
	var _d=instance_create_depth(newLetterX,newLetterY,depth-1,oDiagLetter);
	_d.leftShift=leftShift;
	_d.letter=letter;
	if is_undefined(letterState) _d.letterState=letterStates[newLetterInd+1];
	else _d.letterState=letterState;
	newLetterX+=string_width(letter);
	return _d;
}