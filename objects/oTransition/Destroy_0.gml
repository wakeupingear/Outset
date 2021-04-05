/// @description Reset transitioning
global.transitioning=false;
if instance_exists(ply) with ply 
{
	var _l=ds_list_create();
	instance_place_list(x,y,oRoomswitch,_l,false)
	for (var i=0;i<ds_list_size(_l);i++) if place_meeting(x,y,_l[|i]) _l[|i].touch=true;
	ds_list_destroy(_l);
}