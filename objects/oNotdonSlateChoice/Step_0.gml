/// @description Inputs
if !instance_exists(oCursor) //view
{
	if buttonPressed(control.confirm)&&!oPopup.exiting oPopup.exiting=true;
}
else if oPopup.mode>-1
{
	var _x=oCursor.x-x;
	var _y=oCursor.y-y;
	if !place_meeting(x,y,oCursor) hover=-1;
	else if _y<-abs(_x/2.5) hover=0;
	else if _x>0 hover=1;
	else hover=2;
	//TODO: heartbeat effect during choice
	if hover>-1&&buttonPressed(control.confirm)
	{
		global.completedChapters++;
		global.currentChapter=2+hover;
		oPopup.mode=-1;
		var _key="c1_airChoice";
		if global.currentChapter==chapters.island _key="c1_islandChoice";
		else if global.currentChapter==chapters.wastes _key="c1_wastesChoice";
		with oTextbox text=array_combine(text,textLoad(_key));
	}
}