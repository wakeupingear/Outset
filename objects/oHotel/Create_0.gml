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

var _floorCount=4;
for (var i=0;i<_floorCount;i++)
{
	var _y=y-75-40*i;
	var _m=instance_create_depth(x,_y,depth,oSeethrough);
	_m.sprite_index=sHotelFloorMid;
	var _r=instance_create_depth(x,_y,depth,oSeethrough);
	_r.sprite_index=sHotelFloorRoom;
	var _l=instance_create_depth(x,_y,depth,oSeethrough);
	_l.sprite_index=sHotelFloorRoom;
	_l.image_xscale=-1;
	array_push(seethrough,_m,_r,_l);
	
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
	if i+1==_floorCount _e.up="";
	array_push(objects,_e);
}

for (var i=0;i<array_length(seethrough);i++) seethrough[i].frontSpr=seethrough[i].sprite_index;