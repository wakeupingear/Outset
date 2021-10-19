/// @description Pause menu
if !global.notPause
{
	if pauseAlpha<pauseAlphaMax pauseAlpha+=0.1;
	if buttonPressed(control.start)||(((!global.hudSide&&buttonPressed(control.left))||(global.hudSide&&buttonPressed(control.right)))&&instance_exists(pauseMenuSelection)&&pauseMenuSelection.type!="slider")
	{
		ds_stack_pop(menuStack);
		if ds_stack_empty(menuStack) closePauseMenu();
		else
		{
			with oPauseButton 
			{
				if destroy x=x;
				else if active 
				{
					active=false;
					destroy=true;
				}
				else 
				{
					active=true;
					if justSelected
					{
						justSelected=false;
						selected=true;
					}
				}
			}
			pauseMenuCurrent=ds_stack_top(menuStack);
			//loadMenu(pauseMenuCurrent);
		}
	}
}
else
{
	if pauseAlpha>0 pauseAlpha-=0.1;
	if buttonPressed(control.start) 
	{
		ds_stack_push(menuStack,pauseMenuCurrent);
		pausePos=0;
		pauseMenuCopied=-1;
		global.notPause=false;
		surface_set_target(global.guiSurf);
		draw_clear_alpha(c_black,0);
		surface_reset_target();
	}
}

scanTime=(scanTime+1) % 255;
global.scanColor=make_color_hsv(scanTime,255,255);

//discord
if !isHtml&&os_type!=os_linux np_update();