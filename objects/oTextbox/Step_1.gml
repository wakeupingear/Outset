/// @description Text
textboxTime = min(textboxTime+1,200);
if !wait&&global.notPause{
var _touchingPly=false;
if trackObj!=-1&&instance_exists(trackObj)&&!object_is_ancestor(trackObj.object_index,ply) with trackObj _touchingPly=place_meeting(x,y,ply);	

if mode>-1&&mode<2
{
	if mode==0
	{
		skip=false; //reset the skip every frame
		mode=1;
		sentence=processTextVariables(commandProcess(text)); //get the line of text and apply text changes
		if sentence=="stopDiag" 
		{
			for (var i=0;i<instance_number(npc);i++) with instance_find(npc,i) if !object_is_ancestor(object_index,enem) event_user(0); //reload npc text
			if character!=""
			{
				var _obj=asset_get_index("npc"+characterFirstLetterUpper);
				if instance_exists(_obj) 
				{
					trackObj=_obj;
					_obj.pathfindingInterrupt=false;
				}
			}
			mode=-1;
			sentence="";
		}
		else if string_copy(sentence,1,5)=="alarm"
		{
			alarm[0]=int64(string_digits(sentence));
			sentence="";
		}
		else if sentence=="hold" //wait for an external object to continue
		{
			mode=3;
			boxHidden=true;
			sentence="";
		}
		
		charWaitList=array_create(string_length(sentence),0); //process pauses and add them to the charWaitList
		letterStates=array_create(string_length(sentence)+1,0);
		var _lastState=0;
		for (var i=1;i<string_length(sentence)+1;i++) 
		{
			letterStates[i]=_lastState;
			var _ch=string_char_at(sentence,i);
			if _ch=="," charWaitList[i]=commaWait;
			else if _ch=="." charWaitList[i]=periodwait;
			else if i+1<string_length(sentence)&&string_char_at(sentence,i)=="?"&&string_char_at(sentence,i+1)!="?" charWaitList[i]=questionmarkWait;
			else if i+1<string_length(sentence)&&string_char_at(sentence,i)=="!"&&string_char_at(sentence,i+1)!="!" charWaitList[i]=exclamationWait;
			else if _ch=="{"
			{
				var _pos=i;
				while string_char_at(sentence,_pos)!="}" _pos++;
				var _num=real(string_digits(string_copy(sentence,i,_pos-i)));
				charWaitList[i]=_num;
				sentence=string_delete(sentence,i,2+string_length(string(_num)));
				if i>=string_length(sentence) 
				{
					sentence+=" ";
					charWaitList[i-1]=_num;
				}
			}
			else if _ch=="*"
			{
				if _lastState==textState.bold _lastState=textState.normal;
				else if _lastState==textState.boldVibrate _lastState=textState.vibrate;
				else if _lastState==textState.vibrate _lastState=textState.boldVibrate;
				else _lastState=textState.bold;
			}
			else if _ch=="^"
			{
				if _lastState==textState.vibrate _lastState=textState.normal;
				else if _lastState==textState.boldVibrate _lastState=textState.bold;
				else if _lastState==textState.bold _lastState=textState.boldVibrate;
				else _lastState=textState.vibrate;
			}
			
			if letterStates[i]!=_lastState
			{
				sentence=string_delete(sentence,i,1);
				letterStates[i]=_lastState;
				i--;
			}
		}
		textInd=0;
		newLetterInd=0;
		newLetterX=0;
		newLetterY=0;
		with oDiagLetter alarm[0]=1;
		if mode==1 setHeight(); //set the box's position
		setCharacterDiag(); //reprocess character traits in case something changed
		sentenceFormatted=false;
		portOverride=false;
		fontOverride=false;
		textUpdated=false;
	}
	
	if mode==1
	{
		if textInd<string_length(sentence)&&charWaitList[textInd]>0 charWaitList[textInd]--; //wait if this character has a pause
		else 
		{
			textInd++;
			textUpdated=true;
		}
		
		if textInd>1&&(textInd>string_length(sentence)||(!skip&&buttonPressed(control.confirm)))
		{
			textInd=string_length(sentence);
			textUpdated=true;
			if !skip mode=2;
			else 
			{
				mode=0;
			}
		}
	}
}
else if mode==2
{
	//if (!global.menuOpen&&(!mustTouch||_touchingPly))||thisCameraChanged
	{
		if question
		{
			if !questionChoice&&buttonPressed(control.right) questionChoice=1;
			else if questionChoice&&buttonPressed(control.left) questionChoice=0;
		}
		if buttonPressed(control.confirm)
		{
			rumbleStart(rumbleType.lighterPulse);
			if question
			{
				if !questionChoice
				{
					for (var i=diag;i<array_length(text);i++) if text[i]=="#yes"+string(questionNum) 
					{
						diag=i;
						break;
					}
				}
				else
				{
					for (var i=diag;i<array_length(text);i++) if text[i]=="#no"+string(questionNum) 
					{
						diag=i;
						break;
					}
				}
				question=false;
				questionNum=0;
			}
			mode=0;
			skip=false;
			if lastName!=portName
			{
				alarm[1]=1;
				lastName=portName;
			}
		}
	}
}
}