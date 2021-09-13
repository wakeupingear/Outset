event_inherited();

canDropSoul=false;
attacking=false;
enemActive=false;

var _n=object_get_name(object_index);
dieCutscene=["$addData",_n,"$destroy",_n];
dieDelay=60;

if hasData(_n) instance_destroy();