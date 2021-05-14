function hasData(key){
	return (ds_list_find_index(global.data,key)>-1);
}

function getDungeonProgress(dungeon){
	return string_char_at(global.dungeonProgress,dungeon+1);
}

function setDungeonProgress(dungeon,progress){
	string_set(global.dungeonProgress,progress,dungeon+1);
}