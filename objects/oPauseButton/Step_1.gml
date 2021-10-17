/// @description Interact
if selected
{
	if selectedSlide<20 selectedSlide+=4;
}
else
{
	if selectedSlide>0 selectedSlide-=2;
}

if destroy
{
	slideIn-=0.1;
	if slideIn<=0 instance_destroy();
}
else {
	if slideIn<1 slideIn+=0.1;
if active
{
	if selected
	{
		if buttonPressed(control.down)
		{
			buttonFreeze(control.down);
			selected=false;
			next.selected=true;
			oCursor.x=-100;
		}
		else if buttonPressed(control.up)
		{
			buttonFreeze(control.up);
			selected=false;
			previous.selected=true;
			oCursor.x=-100;
		}
		else if buttonPressed(control.confirm)||buttonPressed(control.grapple)
		{
			if is_struct(struct) 
			{
				if type=="toggle" 
				{
					choice=!choice;
					global.accessibility[? key]=choice;
					controller.prefsChanged=true;
					if array_length(labels)>0
					{
						choiceStr=labels[choice];
						setChoiceXscale();
					}
				}
				switch key //direct variable
				{
					case "fullscreen":
						with controller event_user(0);
						break;
					case "guiSide":
						global.hudSide=choice;
						break;
					case "vsync":
						display_reset(0,option("vsync"));
						break;
					case "quitTitle":
						with controller closePauseMenu();
						roomChange(0,0,rTitle,transitions.blackToWhite,0,0,1);
						break;
					case "quitDesktop":
						game_end();
						break;
					default: break;
				}
			}
			else //sub menu
			{
				justSelected=true;
				controller.pauseMenuCurrent=key;
				ds_stack_push(controller.menuStack,key);
				with controller
				{
					loadMenu(pauseMenuCurrent);
				}
			}
		}
		else if (buttonPressed(control.left)||buttonPressed(control.right))&&type=="slider"
		{
			var _dir=(buttonPressed(control.right)-buttonPressed(control.left));
			if (_dir==1&&choice<struct.endPos)||(_dir==-1&&choice>struct.startPos)
			{
				choice+=struct.tick*_dir;
				choiceStr=string(round(choice*100))+"%";
				setChoiceXscale();
				switch key
				{
					case "musicVol":
						audio_group_set_gain(audiogroup_music,choice,0);
						break;
					case "sfxVol":
						audio_group_set_gain(audiogroup_sounds,choice,0);
						break;
					default: break;
				}
				global.accessibility[? key]=choice;
				controller.prefsChanged=true;
			}
		}
	}
	else if place_meeting(x+camX(),y+camY(),oMouse)
	{
		with oPauseButton selected=false;
		selected=true;
	}
	
	if slideProg>0 slideProg-=0.1;
}
else
{
	if slideProg<1 slideProg+=0.1;
}
}