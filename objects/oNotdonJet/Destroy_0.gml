/// @description Remove event
if saveEvent eventRemove(object_index,startroom,x,y,layer,args);

for (var i=0;i<array_length(followObjs);i++) instance_destroy(followObjs[i]);