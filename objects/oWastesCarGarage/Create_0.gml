/// @description Check if it exists
event_inherited();
key="wastes_car_garage";
image_speed=0;
if hasData("wCar") instance_destroy(id,false);
else
{
	oilSystem=part_system_create_layer("behind",false);
	ds_list_add(global.particleSystems,oilSystem);
	oilEmitter=part_emitter_create(oilSystem);
	part_emitter_region(oilSystem,oilEmitter,x-16,x+16,y,y,ps_shape_rectangle,ps_distr_linear);
	oilPart=part_type_create();
	part_type_sprite(oilPart,sPlaceholderPixelBlack,false,false,false);
	part_type_life(oilPart,50,50);
	part_type_gravity(oilPart,0.15,270);
	part_emitter_stream(oilSystem,oilEmitter,oilPart,-2);
}