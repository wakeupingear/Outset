with controller removeCamera(room_get_name(room),x,"y");
if hasData("hotel")!=room instance_destroy(id,false);
else {
hit=[];
array_push(hit,
	instance_create_depth(x-102,y+55,depth,hitobj),
	instance_create_depth(x,y,depth,hitobj)
);

hit[0].image_xscale=204;
hit[0].image_yscale=5;
hit[0].visible=true;
hit[1].sprite_index=sHotelLobbyColl;

seethrough=[];
array_push(seethrough,
	instance_create_depth(x,y,depth,oSeethrough)
);
seethrough[0].sprite_index=sHotelLobby;

objects=[];
array_push(objects,
	instance_create_depth(x,y+41,depth,oElevator)
);
objects[0].down="";

var _floorCount=3;
//floors
for (var i=0;i<=_floorCount;i++)
{
	var _y=y-75-40*i;
	
	var _g=instance_create_depth(x-78,_y+18,depth,hitobj);
	_g.image_xscale=156;
	_g.image_yscale=4;
	var _rw=instance_create_depth(x+74,_y-20,depth,hitobj);
	_rw.image_xscale=4;
	_rw.image_yscale=40;
	var _lw=instance_create_depth(x-78,_y-20,depth,hitobj);
	_lw.image_xscale=4;
	_lw.image_yscale=40;
	array_push(hit,_g,_rw,_lw);
	
	var _e=instance_create_depth(x,_y+9,depth,oElevator);
	array_push(objects,_e);
	
	if i==_floorCount
	{
		var _c=instance_create_depth(x-78,_y-60,depth,hitobj);
		array_push(hit,_c);
		_e.up="";
	}
	else
	{
		var _m=instance_create_depth(x,_y,depth,oSeethrough);
		_m.sprite_index=sHotelFloorMid;
		var _r=instance_create_depth(x,_y,depth,oSeethrough);
		_r.sprite_index=sHotelFloorRoom;
		var _l=instance_create_depth(x,_y,depth,oSeethrough);
		_l.sprite_index=sHotelFloorRoom;
		_l.image_xscale=-1;
		array_push(seethrough,_m,_r,_l);
	}
}

for (var i=0;i<array_length(seethrough);i++) seethrough[i].frontSpr=seethrough[i].sprite_index;

hotelComponents=[hit,seethrough,objects];
for (var i=0;i<array_length(hotelComponents);i++)
{
	for (var k=0;k<array_length(hotelComponents[i]);k++)
	{
		with hotelComponents[i][k]
		{
			xOff=x-oHotel.x;
			yOff=y-oHotel.y;
		}
	}
}

floatMove=function(){
	for (var i=0;i<array_length(hotelComponents);i++)
	{
		for (var k=0;k<array_length(hotelComponents[i]);k++)
		{
			with hotelComponents[i][k]
			{
				x=oHotel.x+xOff;
				y=oHotel.y+yOff;
			}
		}
	}
}
controller.addRoomCamera(room_get_name(room),x-90,y-175-_floorCount*40,x+90,y+75,x,"y");
}