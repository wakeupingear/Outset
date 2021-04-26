/// @description Text
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
		for (var i=1;i<string_length(sentence);i++) 
		{
			if string_char_at(sentence,i)=="," charWaitList[i]=commaWait;
			else if string_char_at(sentence,i)=="." charWaitList[i]=periodwait;
			else if i+1<string_length(sentence)&&string_char_at(sentence,i)=="?"&&string_char_at(sentence,i+1)!="?" charWaitList[i]=questionmarkWait;
			else if i+1<string_length(sentence)&&string_char_at(sentence,i)=="!"&&string_char_at(sentence,i+1)!="!" charWaitList[i]=exclamationWait;
			else if string_char_at(sentence,i)=="{"
			{
				var _pos=i;
				while string_char_at(sentence,_pos)!="}" _pos++;
				try var _num=real(string_digits(string_copy(sentence,i,_pos-i)));
				charWaitList[i]=_num;
				sentence=string_delete(sentence,i,2+string_length(string(_num)));
			}
			
		}
		textInd=0;
		setHeight(); //set the box's position
		setCharacterDiag(); //reprocess character traits in case something changed
		sentenceFormatted=false;
		portOverride=false;
		fontOverride=false;
	}
	
	if mode==1
	{
		if textInd<string_length(sentence)&&charWaitList[textInd]>0 charWaitList[textInd]--; //wait if this character has a pause
		else textInd++;
		if textInd>1&&(textInd>string_length(sentence)||buttonPressed(control.confirm))
		{
			textInd=string_length(sentence);
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