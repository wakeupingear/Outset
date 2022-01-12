maxHealth=10;
event_inherited();
xscale=-1;

checkActive=function(){
	if !instance_exists(ply)||!instance_exists(oWastesWarehouse) return false;
	return (abs(ply.x-oWastesWarehouse.x)<160&&ply.y>oWastesWarehouse.y+24);
}

plyInArena=function(){
	return instance_exists(ply)&&(abs(ply.x-oWastesWarehouse.x)<160&&ply.y>oWastesWarehouse.y-38)
}

enum GeneralFight {
	idle,
	calling,
	fleeing,
	shootBox,
	shootPly,
	defeated
}
delay=60;
fightState=GeneralFight.idle;
nextState=GeneralFight.calling;

patternType=0;
patternInd=0;
orderedPatterns = ds_list_create();
	/*[
		[545, 290, oWastesCrate],
		[576, 290, oWastesCrate],
		[607, 321, oWastesCrate],
		[576, 321, oWastesCrate],
		[576, 352, oWastesCrate],
		[576, 383, oWastesCrate],
		[607, 383, oWastesCrate],
	]*/
randomPatterns=ds_list_create();

loadCrates=function(list,tag){
	for (var i=1;layer_exists(tag+string(i));i++){
		var _layer=layer_get_id(tag+string(i));
		var _assets=layer_get_all_elements(_layer);
		var _arr=[];
		for (var k=0;k<array_length(_assets);k++){
			var _id=layer_instance_get_instance(_assets[k]);
			with _id {
				if array_length(contents)==0 array_push(_arr,[x,y,object_index]);
				else array_push(_arr,[x,y,object_index,contents]);
				instance_destroy(hit);
				instance_destroy(id,false);
			}
		}
		ds_list_add(list,_arr);
		//instance_deactivate_layer(_layer);
	}
}
alarm[4]=1;

objects=ds_list_create();
containers=ds_list_create();

resetExtra=function(){
	delay=60;
	fightState=GeneralFight.idle;
	nextState=GeneralFight.calling;
	patternType=0;
	patternInd=0;
	for (var i=0;i<ds_list_size(objects);i++){
		if instance_exists(objects[|i]) instance_destroy(objects[|i]);
	}
	ds_list_clear(objects);
	ds_list_clear(containers);
	x=xstart;
	y=ystart;
}

attackAnimation=new Animation();

dieThreshold=4;
dieCutscene="wastes_car_warehouse";
enemHitTrigger=function(){
	image_blend=c_red;
	if fightState!=GeneralFight.calling&&fightState!=GeneralFight.fleeing{
		fightState=GeneralFight.calling;
		delay=15;
	}
}

fireMissile=function(targetObj){
	if !instance_exists(targetObj) return noone;
	var _m=instance_create_layer(x,y,"people",oMissile);
	with _m {
		direction=point_direction(x,y,targetObj.x,targetObj.y);
		hitTerrain=0;
		target=targetObj;
		image_index=2;
	}
}

moveToSide=function(isRight){
	var _x=(!isRight)?(oWastesWarehouse.x-110):(oWastesWarehouse.x+110);
	var _y=oWastesWarehouse.y+60;
	pathfindingStart(id,"simpleJ{"+string(_x)+","+string(_y)+"}_ALWAYSJUMP");
}

ai=function(){
	if !pathfinding&&groundCollision(x,y+1) delay--; //while touching ground
	if delay<=0{
		var _origState=fightState;
		switch _origState {
			case GeneralFight.defeated: {
				nextState=GeneralFight.defeated;
				break;
			}
			case GeneralFight.idle:
				delay=180;
				var _empty=true;
				for (var i=0;i<ds_list_size(objects);i++) {
					if objects[|i]!=noone{
						_empty=false;
						break;
					}
				}
				if _empty {
					nextState=GeneralFight.calling;
					delay=30;
				}	
				else if ds_list_size(containers)>0 nextState=GeneralFight.shootBox;
				else nextState=GeneralFight.shootPly;
				break;
			case GeneralFight.shootBox:
				for (var i=0;i<ds_list_size(containers);i++){
					fireMissile(containers[|i]);
				}
				delay=120;
				nextState=GeneralFight.idle;
				break;
			case GeneralFight.shootPly:
				fireMissile(ply);
				delay=60;
				nextState=GeneralFight.idle;
				break;
			case GeneralFight.calling:
				var _p=-1;
				if patternType==0&&patternInd<ds_list_size(orderedPatterns){
					_p=orderedPatterns[|patternInd];
					patternInd++;
				}
				else {
					if patternType==0 patternInd=0;
					patternType=1;
					var _cInd=patternInd;
					if ds_list_size(randomPatterns)>1 while patternInd==_cInd patternInd=irandom(ds_list_size(randomPatterns)-1);
					_p=randomPatterns[|patternInd];
				}
				
				for (var i=0;i<ds_list_size(objects);i++){
					if instance_exists(objects[|i]) instance_destroy(objects[|i]);
				}
				ds_list_clear(objects);
				ds_list_clear(containers);
				for (var i=0;i<array_length(_p);i++){
					var _o=instance_create_depth(_p[i][0],_p[i][1],depth,_p[i][2]);
					var _ind=ds_list_size(objects);
					with _o {
						spawned=true;
						spawnIndex=_ind;
						moving=true;
						y+=200;
						if instance_exists(hit) hit.y+=200;
					}
					_o.spawnParent=id;
					if array_length(_p[i])==4 {
						_o.contents=_p[i][3];
						ds_list_add(containers,_o);
					}
					ds_list_add(objects,_o);
				}
				
				delay=240;
				if instance_exists(ply)&&sign(ply.x-oWastesWarehouse.x)==sign(x-oWastesWarehouse.x){
					nextState=GeneralFight.fleeing;
					delay=30;
				}
				else nextState=GeneralFight.idle;
				break;
			case GeneralFight.fleeing:
				jumpAdd=1;
				moveToSide(x<oWastesWarehouse.x);
				nextState=GeneralFight.idle;
				delay=15;
				break;
		}
		fightState=nextState;
	}
	show_debug_message(jumpAdd)
}