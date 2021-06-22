function hasData(key){
	if !ds_map_exists(global.data,key) return false;
	return global.data[? key];
}

function getDungeonProgress(dungeon){
	return string_char_at(global.dungeonProgress,dungeon+1);
}

function setDungeonProgress(dungeon,progress){
	string_set(global.dungeonProgress,progress,dungeon+1);
}