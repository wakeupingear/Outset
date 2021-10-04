commands=ds_list_create();
leftPadding=16;
keyboard_string="";

scripts=ds_map_create();
for (var i=0;script_exists(i);i++) 
{
	ds_map_add(scripts,script_get_name(i),i);
}
rooms=ds_map_create();
for (var i=0;room_exists(i);i++) ds_map_add(rooms,room_get_name(i),i);

buttonFreeze(control.left);
buttonFreeze(control.right);
buttonFreeze(control.up);
buttonFreeze(control.down);
buttonFreeze(control.grapple);