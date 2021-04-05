/// @description Fire
if firing
{
	if fireMode==0
	{
		shake(2,2,10);
		var _l=ds_list_create();
		instance_place_list(x,y,oTerrainHitobj,_l,false);
		for (var i=0;i<ds_list_size(_l);i++) instance_destroy(_l[|i]);
		ds_list_destroy(_l);
		firing=false;
	}
}