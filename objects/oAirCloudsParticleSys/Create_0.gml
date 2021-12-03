smokeSys=part_system_create_layer("above",false);
part_system_position(smokeSys,0,0);
ds_list_add(global.particleSystems,smokeSys);
smokeEmitter=part_emitter_create(smokeSys);
density=0.5;
smokePart=part_type_create();
part_type_alpha3(smokePart,0,0.1,0);
part_type_sprite(smokePart,sDeathCircle,false,false,false);
part_type_direction(smokePart,80,100,0,0);
part_type_color2(smokePart,merge_color(c_white,c_yellow,0.2),merge_color(c_white,c_black,0.4));
part_type_life(smokePart,120,160);
part_type_speed(smokePart,0.5,0.8,0,0);
part_type_size(smokePart,0,0.4,0.005,0.002);
part_system_automatic_update(smokeSys,false);

rate=0;
resizeSmoke=function(_p){
	var _w=lerp(image_xscale,room_width,_p);
	var _h=lerp(image_yscale,room_height,_p);
	var _x=lerp(x,0,_p);
	var _y=lerp(y,0,_p);
	rate=_w*_h*density/100000;
	part_emitter_region(smokeSys,smokeEmitter,_x,_x+_w,_y,_y+_h,ps_shape_rectangle,ps_distr_linear);
}
resizeSmoke(point_in_rectangle(global.plyX,global.plyY,x,y,image_xscale,image_yscale));
repeat 200 part_system_update(smokeSys);