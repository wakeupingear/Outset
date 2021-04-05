/// @description Remove from list
for (var i=0;i<ds_list_size(global.droppedItems);i+=4) if global.droppedItems[|i]==item
{
	repeat 4 ds_list_delete(global.droppedItems,i);
	break;
}