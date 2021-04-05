/// @description Pause menu
if !global.notPause
{
	if pauseAlpha<pauseAlphaMax pauseAlpha+=0.1;
	if buttonPressed(control.start) 
	{
		if pauseMenuCurrent=="menu1"
		{
			if sprite_exists(pauseMenuCopied)
			{
				sprite_delete(pauseMenuCopied);
			}
			surfPosX=0;
			surfPosY=0;
			removeMenuButtons(0);
			instance_activate_all();
			global.notPause=true;
			setRoomEra(); //only activate room specifc eras
		}
		else
		{
			pauseMenuCurrent=pauseMenuButtons[$ pauseMenuCurrent].parentMenu;
			loadMenu(pauseMenuCurrent);
		}
	}
}
else
{
	if pauseAlpha>0 pauseAlpha-=0.1;
	if buttonPressed(control.start) 
	{
		pausePos=0;
		pauseMenuCopied=-1;
		global.notPause=false;
	}
}