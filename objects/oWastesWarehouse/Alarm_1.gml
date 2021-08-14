/// @description Set index
if !hasData("wWare") addDataPair("wWare",0);
image_index=hasData("wWare");
image_index=frontInd;
behind.image_index=image_index;
hit.image_index=image_index+3;

if image_index==0
{
	instance_create_depth(x+122,y-20,behind.depth-1,oWastesCatwalk);
	oWastesCatwalk.image_xscale=-1;
	instance_create_depth(x-122,y-20,behind.depth-1,oWastesCatwalk);
	oWastesCatwalk.image_angle=180;
	
	var _lc=instance_create_layer(x-90,y-50,"people",oWastesCrate);
	var _rc=instance_create_layer(x+90,y-50,"people",oWastesCrate);
	
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
}