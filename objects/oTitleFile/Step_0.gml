/// @description Selected
if selected||position_meeting(mouse_x,mouse_y,0)
{
	if !selected
	{
		oTitleFile.selected=false;
		selected=true;
		global.lastFile=file;
		//trigger title screen swap
	}
	
	var _clicked=false;
	if place_meeting(x,y,oMouse) _clicked=mouse_check_button(mb_left);
	else _clicked=(buttonPressed(control.confirm)&&!mouse_check_button(mb_left))
	
	if _clicked&&oTitleMenu.fade>0.3
	{
		savePrefs();
		load(file);
		if global.nextRoom==rCoreIntro roomChange(global.plyX,global.plyY,global.nextRoom,transitions.whiteSudden,0,0,global.startXscale);
		else if global.rooms[$ room_get_name(global.nextRoom)].inside roomChange(global.plyX,global.plyY,global.nextRoom,transitions.blackToBlack,0,0,global.startXscale);
		else roomChange(global.plyX,global.plyY,global.nextRoom,transitions.blackToWhite,0,0,global.startXscale);
	}
}
else selected=false;