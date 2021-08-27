/// @description Create event object
image_xscale=args[1];
setState();
if !eventExists(object_index,room,x,y,layer,args) 
{
	eventAddObject(object_index,room,x,y,layer,args);
	alarm[1]=1;
}
else image_index=image_number-1-insideFrameDiff*(args[0]);