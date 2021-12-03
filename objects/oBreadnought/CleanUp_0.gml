/// @description Destroy particles
for (var i=0;i<ds_list_size(partData);i++){
	part_emitter_destroy(partSys,partData[|i][0]);
	part_type_destroy(partData[|i][1]);
}
part_system_destroy(partSys);
ds_list_destroy(partData);