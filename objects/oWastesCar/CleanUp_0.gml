/// @description Add to list
if instance_number(oWastesCar)==1||args[2]
{
	eventRemove(object_index,startRoom,xstart,ystart,"people",args);
	eventAddObject(object_index,room,x,y,"people",[wheels[0].y-y,wheels[1].y-y,1]);
}