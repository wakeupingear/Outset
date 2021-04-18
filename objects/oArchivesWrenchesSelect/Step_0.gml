/// @description Clicked
selection=-1;
if instance_exists(oCursor) for (var i=1;i<image_number;i++)
{
	if wrenches[i-1] continue;
	image_index=i;
	if place_meeting(x,y,oCursor)
	{
		selection=i;
		if buttonPressed(control.confirm) 
		{
			parentObj.exiting=true;
			addData("wr"+string(i));
			oTextbox.text=array_combine(oTextbox.text,["$addItem",["iWrench"+string(i),"text"]]);
			break;
		}
	}
}