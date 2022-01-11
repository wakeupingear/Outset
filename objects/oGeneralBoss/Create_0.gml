maxHealth=30;
event_inherited();

checkActive=function(){
	if !instance_exists(ply)||!instance_exists(oWastesWarehouse) return false;
	return (abs(ply.x-oWastesWarehouse.x)<160&&ply.y>oWastesWarehouse.y+24);
}

enum GeneralFight {
	idle,
	calling,
	fleeing,
	shootBox,
	shootPly
}
delay=60;
fightState=GeneralFight.idle;
nextState=GeneralFight.calling;

patternType=0;
patternInd=0;
orderedPatterns = [
	[
		[545, 290, oWastesCrate],
		[576, 290, oWastesCrate],
		[607, 321, oWastesCrate],
		[576, 321, oWastesCrate],
		[576, 352, oWastesCrate],
		[576, 383, oWastesCrate],
		[607, 383, oWastesCrate],
	]
];
randomPatterns=[
	[],
	[]
];

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


ai=function(){
	if state<=moveState.running delay--; //while touching ground
	if image_blend==c_red&&fightState!=GeneralFight.calling&&fightState!=GeneralFight.fleeing {
		delay=30;
		nextState=GeneralFight.calling;
	}
	else if delay<=0{
		var _origState=fightState;
		fightState=nextState;
		switch _origState {
			case GeneralFight.idle:
				delay=180;
				if ds_list_size(objects)==0 {
					nextState=GeneralFight.calling;
					delay=30;
				}
				else if ds_list_size(containers)>0 nextState=GeneralFight.shootBox;
				else nextState=GeneralFight.shootPly;
				break;
			case GeneralFight.shootBox:
				delay=120;
				nextState=GeneralFight.idle;
				break;
			case GeneralFight.shootPly:
				delay=60;
				nextState=GeneralFight.idle;
				break;
			case GeneralFight.calling:
				var _p=[];
				if patternType==0&&patternInd<array_length(orderedPatterns){
					_p=orderedPatterns[patternInd];
					patternInd++;
				}
				else {
					patternType=1;
					var _cInd=patternInd;
					while patternInd==_cInd patternInd=irandom(array_length(randomPatterns)-1);
					_p=randomPatterns[patternInd];
				}
				
				for (var i=0;i<ds_list_size(objects);i++){
					if instance_exists(objects[|i]) instance_destroy(objects[|i]);
				}
				ds_list_clear(objects);
				ds_list_clear(containers);
				for (var i=0;i<array_length(_p);i++){
					var _o=instance_create_depth(_p[i][0],_p[i][1],depth,_p[i][2]);
					var _ind=ds_list_size(objects);
					_o.spawned=true;
					_o.spawnIndex=_ind;
					_o.spawnParent=id;
					_o.moving=true;
					_o.y+=216;
					if array_length(_p)==4 {
						_o.contents=_p[i][3];
						ds_list_add(containers,_o);
					}
					ds_list_add(objects,_o);
				}
				
				delay=240;
				nextState=GeneralFight.idle;
				break;
		}
	}
}