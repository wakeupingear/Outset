/// @description Remove event
eventRemove(object_index,room,hoverPos.x,hoverPos.y,"bg",[]);
eventRemove(oVBarrier,room,leftBar.x,leftBar.y,"people",[-1]);
eventRemove(oVBarrier,room,rightBar.x,rightBar.y,"people",[1]);
if instance_exists(oVShock) instance_destroy(oVShock);