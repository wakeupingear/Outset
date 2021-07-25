/// @description Selected
if cursorSelected()||(oMouse.x>x-70&&oMouse.x<x+60&&oMouse.y>y-70&&oMouse.y<y-28)
{
	if !selected
	{
		oTitleFile.selected=false;
		selected=true;
		global.lastFile=file;
		//trigger title screen swap
	}
	
	var _clicked=buttonPressed(control.confirm);
	
	if _clicked&&oTitleMenu.fade>0.3
	{
		savePrefs();
		load(file);
		if global.nextRoom==rCoreIntro
		{
			oTitleMenu.open=false;
			instance_destroy(oCursor);
			conversation("pro_coreLoad");
		}
		// roomChange(global.plyX,global.plyY,global.nextRoom,transitions.whiteSudden,0,0,global.startXscale);
		else if global.rooms[$ room_get_name(global.nextRoom)].inside roomChange(global.plyX,global.plyY,global.nextRoom,transitions.blackToBlack,0,0,global.startXscale);
		else roomChange(global.plyX,global.plyY,global.nextRoom,transitions.blackToWhite,0,0,global.startXscale);
	}
}
else selected=false;

image_blend=merge_color(c_white,c_black,selected*0.3);