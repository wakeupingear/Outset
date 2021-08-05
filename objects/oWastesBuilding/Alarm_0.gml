/// @description Create collision
frontSpr=sprite_index;
image_index=2;
switch sprite_index
{
	case sWastesBuildingBeam:
		array_push(hit,
			instance_create_depth(x+3,y,depth,hitobj)
		);
		hit[0].sprite_index=sWastesBuildingBeamColl;
		break;
	case sWastesBuildingHole:
		array_push(hit,
			instance_create_depth(x+3,y,depth,hitobj),
			instance_create_depth(x+83,y,depth,hitobj)
		);
		hit[0].image_xscale=50;
		hit[0].image_yscale=4;
		hit[1].image_xscale=48;
		hit[1].image_yscale=4;
		break;
	default:
		array_push(hit,
			instance_create_depth(x+3,y,depth,hitobj)
		);
		hit[0].image_xscale=130;
		hit[0].image_yscale=4;
		break;
}
event_inherited();
depth=layer_get_depth(layer_get_id("terrain")+1);

//add npcHit under a building to stop the floor from being generated
if !place_meeting(x,y+4,oWastesBuilding)&&!place_meeting(x,y+4,hitobj22) //base
{
	var _base=instance_create_depth(x,y+abs(sprite_height),depth,oPlaceholder);
	_base.sprite_index=sprite_index;
	_base.image_index=3;
	var _h=instance_create_depth(x+3,y+abs(sprite_height),depth,hitobj);
	_h.image_xscale=130;
	_h.image_yscale=3;
	array_push(hit,_base,_h);
}

for (var i=0;i<array_length(hit);i++)
{
	var _i=hit[i];
	_i.x=x+(_i.x-x)*image_xscale;
	_i.y=y+(_i.y-y)*image_yscale;
	_i.image_xscale*=image_xscale;
	_i.image_yscale*=image_yscale;
	_i.image_angle=image_angle;
}