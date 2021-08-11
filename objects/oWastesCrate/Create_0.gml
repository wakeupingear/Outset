image_speed=0;
variations=2;
if sprite_index==sWastesCrateBig variations=3;
image_index=irandom(variations-1);

physicsVars();

contents=[]; //array of structs
above=-1;
behind=-1;

mode=0;
delay=60;
startUnder=false;
hit=instance_create_depth(x-(sprite_get_xoffset(sprite_index)),y+(sprite_height-sprite_get_yoffset(sprite_index))-1,depth,hitobj);
hit.image_xscale=sprite_width;
hit.image_yscale=-sprite_height
//hit.visible=true;
alarm[0]=1;

damageAdjacentCrate=function(xOff,yOff,list){
	instance_place_list(x+xOff,y+yOff,oWastesCrate,list,false);
	var _m=(object_index==oWastesCrateBig)*2;
	for (var i=0;i<ds_list_size(list);i++) if list[|i]!=id with list[|i]
	{
		mode=_m;
		alarm[2]=30;
	}
}

damageCrate=function(){
	if alarm[1]>-1 exit;
	mode++;
	if mode!=3&&place_meeting(x,y-1,oWastesCrate)
	{
		if object_index==oWastesCrateBig mode=0;
		else mode=2;
	}
	if mode==1
	{
		shake(2,2,10);
		image_index+=variations;
		var _list=ds_list_create();
		damageAdjacentCrate(-1,0,_list);
		damageAdjacentCrate(1,0,_list);
		ds_list_destroy(_list);
		alarm[1]=delay;
		setHitHeight();
		for (var i=0;i<array_length(contents);i++) 
		{
			if !is_struct(contents[i]) contents[i]={obj: contents[i]};
			if !variable_struct_exists(contents[i],"x") contents[i].x=x;
			if !variable_struct_exists(contents[i],"y") contents[i].y=y;
			var _o=createObjFromStruct(contents[i]);
			if object_is_ancestor(_o.object_index,enem)
			{
				_o.canDropSoul=false;
				_o.soulNum=0;
			}
			if object_is_ancestor(_o.object_index,oPhysicsObj) with _o while groundCollision(x,y) y--;
		}
		above=instance_create_layer(x,y,"above",oPlaceholder);
		above.sprite_index=sprite_index;
		above.image_index=image_index;
		
		behind=instance_create_depth(x,y,layer_get_depth(layer_get_id("behind"))+1,oPlaceholder);
		behind.sprite_index=sprite_index;
		behind.image_index=image_index+variations;
	}
	else
	{
		var _list=ds_list_create();
		damageAdjacentCrate(-1,0,_list);
		damageAdjacentCrate(1,0,_list);
		damageAdjacentCrate(0,-1,_list);
		damageAdjacentCrate(0,1,_list);
		ds_list_destroy(_list);
		instance_destroy();
	}
}

setHitHeight=function(){
	switch sprite_index
	{
		case sWastesCrateBig:
			switch image_index%variations
			{
				case 0:
					hit.image_yscale=-48;
					break;
				case 1:
					hit.image_yscale=-33;
					break;
				default:
					hit.image_yscale=-28;
					break;
			}
			break;
		default:
			hit.image_yscale=-18;
			break;
	}
}

destroyObjs=function(){
	instance_destroy(hit);
	if behind>-1 instance_destroy(behind);
	if above>-1 instance_destroy(above);
}