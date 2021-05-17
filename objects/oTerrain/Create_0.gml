terrain=ds_list_create();
terrainSprites=[];
terrainColor=ds_list_create();
surf=-1;
render=false;

roomType=0;
colorData=[];
terrainBlend=[0,0,0];
addColorData=function(region,color,outlineCol){
	if is_string(color) color=hex(color);
	array_set(colorData,region,{
		baseColor: [color_get_red(color)/255,color_get_green(color)/255,color_get_blue(color)/255]
	});
	if !is_undefined(outlineCol) 
	{
		if is_string(outlineCol) outlineCol=hex(outlineCol);
		colorData[region].outlineCol=[color_get_red(outlineCol)/255,color_get_green(outlineCol)/255,color_get_blue(outlineCol)/255];
	}
}

addColorData(worldRegion.notdon,"363636","4C4C4C");
addColorData(worldRegion.west,"363636","4C4C4C");
addColorData(worldRegion.core,"E2E2E2");
addColorData(worldRegion.vr,"959595","555555");

roomRegion=worldRegion.notdon;
var _n=room_get_name(room);
if variable_struct_exists(global.rooms,_n) roomRegion=global.rooms[$ room_get_name(room)].region;