//format the string for the first frame
if !sentenceFormatted
{
	var _len=string_length(sentence)
	var _maxWidth=round((384-(2*textX+leftShift+rightShift))*guiX());
	var _sentShift=sentence
	if _maxWidth-string_width(_sentShift)<0&&string_pos(" ",_sentShift)>0
	{
		var _pos=1;
		while _maxWidth-string_width(_sentShift)<0&&_pos<string_length(_sentShift)+1&&string_pos(" ",string_copy(_sentShift,_pos,_len-_pos-1))>0
		{
			var _nextPos=_pos;
			while (string_char_at(_sentShift,_nextPos)!=" "||string_width(string_copy(_sentShift,_pos,_nextPos-_pos))<_maxWidth)&&_nextPos<_len
			{
				_nextPos++; //find next offbox space
			}
			while string_char_at(_sentShift,_nextPos)==" " _nextPos--; //move behind the space(s)
			while string_char_at(_sentShift,_nextPos)!=" " _nextPos--; //move to the last space
			_sentShift=string_insert("\n",string_delete(_sentShift,_nextPos,1),_nextPos); //replace the space with a new line
			_pos=_nextPos+2; //shift the position to the start of the new line
		}
		sentence=_sentShift
	}
	sentenceFormatted=true;
}

//create letters
if textUpdated&&alarm[0]==-1&&sentence!=""
{
	while newLetterInd<textInd
	{
		var _let=string_char_at(sentence,newLetterInd+1)
		if _let=="\n"
		{
			newLetterX=0;
			newLetterY+=string_height("f");
		}
		else
		{
			var _d=instance_create_depth(newLetterX,newLetterY,depth-1,oDiagLetter);
			_d.letter=_let;
			_d.letterState=letterStates[newLetterInd+1];
			newLetterX+=string_width(_let);
		}
		newLetterInd++;
	}
	textUpdated=false;
}

//draw everything
surface_set_target(global.guiSurf);
draw_set_alpha(max(0,image_alpha-(1-nameAlpha)));
if false&&!boxHidden&&portName!=""&&array_length(portLeft)+array_length(portRight)==1
{
	setFont(fontSizes.small);
	var _l=string_width(portName);
	var _h=string_height(portName)/8;
	if array_length(portLeft)>0 draw_text((x+textX)*guiX(),(y+textY+32)*guiY()+_h,portName);
	else draw_text((x+384-(textX))*guiX()-_l,(y+textY+32)*guiY()+_h,portName);
	setFont(fontSizes.medium);
}

draw_set_alpha(image_alpha);

var _sentShift=string_copy(sentence,1,textInd);
var _xPos=round(((x+textX)+leftShift)*guiX());
var _yPos=round((y+textY)*guiY());
with oDiagLetter 
{
	var _x=x;
	var _y=y-(alarm[0]>-1&&oTextbox.image_alpha==1)*round(image_alpha*5)*guiY();
	if letterState==textState.vibrate||letterState==textState.boldVibrate
	{
		_x+=irandom_range(-vibrateAmp,vibrateAmp);
		_y+=irandom_range(-vibrateAmp,vibrateAmp);
	}
	
	if letterState==textState.bold||letterState==textState.boldVibrate draw_text_outline_transformed_color(_xPos+_x,_yPos+_y,letter,c_white,c_white,image_alpha,c_nearBlack,c_nearBlack,image_alpha,8,16,1,1,0);
	else draw_text_color(_xPos+_x,_yPos+_y,letter,c_white,c_white,c_white,c_white,image_alpha);
}
surface_reset_target();
draw_set_alpha(1);