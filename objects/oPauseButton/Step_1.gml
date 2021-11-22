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
		controller.pauseMenuSelection=id;
		if buttonPressedRepeat(control.down)
		{
			buttonIncrement(control.down);
			selected=false;
			next.selected=true;
			oCursor.x=-100;
		}
		else if buttonPressedRepeat(control.up)
		{
			buttonIncrement(control.up);
			selected=false;
			previous.selected=true;
			oCursor.x=-100;
		}
		else {
			if buttonPressed(control.confirm)||buttonPressed(control.grapple)
			{
				if type=="toggle" 
				{
					clickEffect();
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
			
			if (buttonPressed(control.confirm)||(!global.hudSide&&buttonPressed(control.right))||(global.hudSide&&buttonPressed(control.left))) //sub menu
			{
				if type=="menu"
				{
					justSelected=true;
					controller.pauseMenuCurrent=key;
					ds_stack_push(controller.menuStack,key);
					with controller
					{
						loadMenu(pauseMenuCurrent);
					}
				}
				else if type=="object"
				{
					var _c=instance_create_depth(x,y,depth-1,asset_get_index(struct.object));
					controller.menuObj=_c;
					justSelected=true;
					with oPauseButton
					{
						active=false;
						selected=false;
					}
				}
			}
			
			if type=="slider"
			{
				var _dir=(buttonPressedRepeat(control.right)-buttonPressedRepeat(control.left));
				var _selected=(buttonPressed(control.confirm)||buttonPressed(control.grapple));
				show_debug_message(labels)
				if array_length(labels)>0
				{
					if _selected
					{
						switch key
						{
							case "guiScale":
								with controller setDefaultHudSize();
								choice=global.guiScale;
								break;
							default: break;
						}
					}
					else 
					{
						choice+=_dir;
						if choice<0 choice=array_length(labels)-1;
						else if choice>array_length(labels)-1 choice=0;
						switch key
						{
							case "guiScale":
								global.guiScale=choice;
								with controller setHudSize();
								break;
							default: break;
						}
					}
					choiceStr=labels[choice];
				}
				else if (_dir==1&&choice<struct.endPos)||(_dir==-1&&choice>struct.startPos)||_selected
				{
					if _selected choice=!choice;
					else choice+=struct.tick*_dir;
					choiceStr=string(round(choice*100))+"%";
					setChoiceXscale();
					clickEffect();
					switch key
					{
						case "musicVol":
							audio_group_set_gain(audiogroup_music,choice,0);
							break;
						case "sfxVol":
							audio_group_set_gain(audiogroup_sounds,choice,0);
							break;
						case "camShake":
							global.shakeFactor=choice;
							break;
						case "hudAlpha":
							global.hudAlpha=choice;
							break;
						default: break;
					}
					global.accessibility[? key]=choice;
					controller.prefsChanged=true;
				}
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