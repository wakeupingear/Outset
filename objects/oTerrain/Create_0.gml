terrain=ds_list_create();
terrainSprites=[];
terrainColor=ds_list_create();
surf=-1;
surf2=-1;
render=false;
texRender=false;
texInd=0;

deathScale=!global.alive;
deathAng=0;
deathDistMax=370;
deathDist=(!global.alive)*deathDistMax;
deathSaveAng=0;
deathMaxDistanceToSave=270;
deathDistanceToSave=deathMaxDistanceToSave;
deathBubbleProg=0;

roomType=0;
colorData=array_create(30);
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

addColorData(worldRegion.notdon,"333333","4C4C4C");
addColorData(worldRegion.west,"4C4C4C","666666");
addColorData(worldRegion.air,"363636","4C4C4C");
addColorData(worldRegion.deeptown,"282A66","1E1F4C");
addColorData(worldRegion.east,"A0410D","000000");
addColorData(worldRegion.core,"E2E2E2","898989");
addColorData(worldRegion.vr,"333333","4C4C4C");
addColorData(worldRegion.testing,"333333","4C4C4C");
roomRegion=worldRegion.notdon;
layerName="";
var _n=room_get_name(room);
if variable_struct_exists(global.rooms,_n) roomRegion=global.rooms[$ room_get_name(room)].region;

//region specific variables
vrAlpha=hasItem("iGrapple")*0.975;
vrBlendInd=20;
addColorData(vrBlendInd,"FFFFFF","FFFFFF");

mykoBlendInd=21;
addColorData(mykoBlendInd,"FFFFFF","614A30");

event_user(0);