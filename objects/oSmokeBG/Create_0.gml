/// @description Create particle system
event_inherited();
partSys=part_system_create_layer("bgAsset",false);
partType=part_type_create();
part_type_alpha3(partType,0,0.2,-0.5);
//part_type_sprite(partType,circle,false,false,false);
part_type_shape(partType,pt_shape_disk);
part_type_direction(partType,80,100,0,0);
part_type_life(partType,120,160);
part_type_speed(partType,0.7,1,0,0);
part_type_size(partType,0.5,0.7,-0.005,0);
partEmitter=part_emitter_create(partSys);
part_emitter_region(partSys,partEmitter,0,room_width*xLerp,0,room_height*yLerp+384,ps_shape_rectangle,ps_distr_linear);
part_system_automatic_update(partSys,false);