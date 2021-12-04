event_inherited();
image_index=1;

net=instance_create_layer(x,y,"above",oPlaceholder);
net.sprite_index=sprite_index;
net.image_speed=0;
net.image_index=2;

back=instance_create_layer(x,y,"behind",oPlaceholder);
back.sprite_index=sprite_index;
back.image_speed=0;
back.image_index=3;

smokestacks=[
	instance_create_depth(x-80-80,y-184+32,depth+1,oPlaceholder),
	instance_create_depth(x+80-80,y-184+32,depth+1,oPlaceholder),
	instance_create_depth(x+80-80,y-184+32-112,depth+1,oPlaceholder)
];
objects=ds_list_create();
var _l=objects;
for (var i=0;i<array_length(smokestacks);i++) with smokestacks[i] {
	sprite_index=sBreadnoughtSmokestack;
	if (i!=1) {
		image_index=1;
		var _h=instance_create_layer(x,y,"people",hitobj);
		_h.sprite_index=sprite_index;
		_h.image_index=2;
		var _w=instance_create_layer(x+8,y-82,"people",oWind);
		_w.image_xscale=72;
		_w.image_yscale=82;
		_w.direction=90;
		_w.spd=0.5;
		
		ds_list_add(_l,_h);
	}
	image_speed=0;
}

partSys=part_system_create_layer("behindAsset",false);
ds_list_add(global.particleSystems,partSys);
partData=ds_list_create();
createSmoke=function(_x1,_x2,_y1,_y2,rate,startBlend,endBlend){
	var partEmitter=part_emitter_create(partSys);
	part_emitter_region(partSys,partEmitter,_x1,_x2,_y1,_y2,ps_shape_rectangle,ps_distr_linear);

	var partType=part_type_create();
	part_type_sprite(partType,sDeathCircle,false,false,false);
	part_type_life(partType,80,100);
	part_type_alpha2(partType,2,0);
	part_type_scale(partType,0.2,0.2);
	part_type_gravity(partType,0.11,135);
	part_type_speed(partType,1.3,2.4,0.01,0);
	part_type_direction(partType,60,90,0,0);
	part_type_colour2(partType,startBlend,endBlend);
	part_emitter_stream(partSys,partEmitter,partType,rate);
	part_system_automatic_update(partSys,false);
	
	ds_list_add(partData,[partEmitter,partType]);
}
createSmoke(smokestacks[0].x+16,smokestacks[0].x+72,smokestacks[0].y,smokestacks[0].y,4,c_white,merge_color(c_white,c_black,0.8));
createSmoke(smokestacks[2].x+16,smokestacks[2].x+72,smokestacks[2].y,smokestacks[2].y,4,c_white,merge_color(c_white,c_black,0.8));