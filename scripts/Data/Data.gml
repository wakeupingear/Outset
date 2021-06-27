function addData(_val){
	global.data[? _val]=true;
}

function addDataPair(_key,_val){
	global.data[? _key]=_val;
}

function hasData(key){
	if !ds_map_exists(global.data,key) return false;
	return global.data[? key];
}

function removeData(key){
	ds_map_delete(global.data,key);
}

function getDungeonProgress(dungeon){
	return string_char_at(global.dungeonProgress,dungeon+1);
}

function setDungeonProgress(dungeon,progress){
	string_set(global.dungeonProgress,progress,dungeon+1);
}