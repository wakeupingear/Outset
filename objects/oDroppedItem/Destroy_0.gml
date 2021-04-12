/// @description Remove from list
for (var i=0;i<ds_list_size(global.droppedItems);i+=4) if global.droppedItems[|i]==item&&global.droppedItems[|i+1]==x&&global.droppedItems[|i+2]==y&&global.droppedItems[|i+3]==room
{
	repeat 4 ds_list_delete(global.droppedItems,i);
	break;
}