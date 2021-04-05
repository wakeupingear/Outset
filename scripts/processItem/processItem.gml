// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function processItem(item){
	if numOfItem(item)>0 global.playerItems[|ds_list_find_index(global.playerItems,item)+1]++;
	else ds_list_add(global.playerItems,item,1);
}