// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function numOfItem(item){
	if ds_list_find_index(global.playerItems,item)==-1 return 0;
	return ds_list_find_value(global.playerItems,ds_list_find_index(global.playerItems,item)+1);
}