image_speed=0;

targetroom=room;
target_x=-1;
target_y=0;
move=0;
ymove=0;
mode=0;

door=object_is_ancestor(object_index,oDoor)||object_index==oDoor;
if door 
{
	otherDoor=-1;
	check=4;
}

transition=0;
xscale=0;

touch=false;