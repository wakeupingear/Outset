/// @description Clicked
if cursorSelected()||(abs(oMouse.x-x)<19&&oMouse.y-y>-70&&oMouse.y-y<-36)
{
	selected=true;
	if buttonPressed(control.confirm)
	{
		selected=false;
		buttonFreeze(control.confirm);
		with oTitleMenu
		{
			numOfFiles++;
			load("TEMPLATE"); //load default variable data
			createFile(numOfFiles-1);
		}
		y+=oTitleMenu.filePadding;
	}
}
else selected=false;

image_blend=merge_color(c_white,c_black,selected*0.3);