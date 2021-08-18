/// @description Set index
depth=layer_get_depth("terrain")+1; //terrain needs to be above the upper layer
if !hasData("wWare") addDataPair("wWare",image_index);
frontInd=hasData("wWare");
image_index=frontInd;
behind.image_index=image_index;
hit.image_index=image_index+3;

if instance_exists(oWastesCatwalk) instance_destroy(oWastesCatwalk);
var _l=ds_list_create();
instance_place_list(x,y,oWastesCrate,_l,false);
for (var i=0;i<ds_list_size(_l);i++) if abs(x-_l[|i].x)<170 instance_destroy(_l[|i]);
ds_list_destroy(_l);

if image_index==0
{
	instance_create_depth(x+122,y-20,behind.depth-1,oWastesCatwalk);
	oWastesCatwalk.image_xscale=-1;
	instance_create_depth(x-122,y-20,behind.depth-1,oWastesCatwalk);
	oWastesCatwalk.image_angle=180;
	
	var _lc=instance_create_depth(x-90,y-50,depth+1,oWastesCrate);
	var _rc=instance_create_depth(x+90,y-50,depth+1,oWastesCrate);
	
	catwalkFloor=instance_create_depth(x-30,y-21,depth,hitobj);
	catwalkFloor.image_xscale=60;
	catwalkFloor.image_yscale=4;
	
	var _int=instance_create_depth(x,y-26,depth,oInteractable);
	_int.sprite_index=sPlaceholderDoor;
	if !hasData("wGen1Start")
	{
		_int.key="wastes_general_intro";
		_int.check=12;
	}
	else
	{
		_int.check=13;
	}
	
	with oWastesTower if x>oWastesWarehouse.x y=ystart;
}
else
{
	with oWastesTower if x>oWastesWarehouse.x y=-100;
}

if instance_exists(oWastesCrateWreckage) with oWastesCrateWreckage setPosition();