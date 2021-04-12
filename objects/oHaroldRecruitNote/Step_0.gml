/// @description Interactions
image_index=place_meeting(x,y,oMouse);
if image_index&&parentObj.stackType==0&&buttonPressed(control.confirm)
{
	createPopup(textLoad("pro_haroldLetter"));
}