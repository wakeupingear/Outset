// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createDroppedItems(){
	for (var i=0;i<ds_list_size(global.droppedItems);i+=4) if room==global.droppedItems[|i+3]
	{
		var _i=instance_create_depth(global.droppedItems[|i+1],global.droppedItems[|i+2],layer_get_depth(layer_get_id("people")),oDroppedItem);
		_i.item=global.droppedItems[|i];
	}
}