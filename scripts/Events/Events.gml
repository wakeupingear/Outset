// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function eventExists(object,objRoom,xStart,yStart,objLayer,args){
	if !is_string(objRoom) objRoom=room_get_name(objRoom);
	if !ds_map_exists(global.persistentEvents,objRoom)||global.persistentEvents[? objRoom]==[] return false;
	var _arr=global.persistentEvents[? objRoom];
	for (var i=0;i<array_length(_arr);i+=5)
	{
		if _arr[i]==object&&
		(xStart=="x"||xStart==_arr[i+1])&&
		(yStart=="y"||yStart==_arr[i+2])&&
		objLayer==_arr[i+3]&&
		array_equals(args,_arr[i+4]) return true;
	}
	return false;
}

function eventExistsDefault(xStart,yStart){
	if layer==-1 return eventExists(object_index,room,xStart,yStart,"any",[]);
	return eventExists(object_index,room,xStart,yStart,layer_get_name(layer),[]);
}

function eventRemove(object,objRoom,xStart,yStart,objLayer,args){
	if !is_string(objRoom) objRoom=room_get_name(objRoom);
	if ds_map_exists(global.persistentEvents,objRoom)&&global.persistentEvents[? objRoom]!=[]{
	var _arr=global.persistentEvents[? objRoom];
	for (var i=0;i<array_length(_arr);i+=5)
	{
		if _arr[i]==object&&
		(xStart=="x"||xStart==_arr[i+1])&&
		(yStart=="y"||yStart==_arr[i+2])&&
		objLayer==_arr[i+3]&&
		array_equals(args,_arr[i+4])
		{
			global.persistentEvents[? objRoom]=array_remove(_arr,i,5);
			break;
		}
	}
	}
}

function eventRemoveDefault(xStart,yStart){
	eventRemove(object_index,room,xStart,yStart,layer_get_name(layer),[]);
}

function eventAddObject(object,objRoom,xStart,yStart,objLayer,args){
	if !is_string(objRoom) objRoom=room_get_name(objRoom);
	if !ds_map_exists(global.persistentEvents,objRoom) ds_map_add(global.persistentEvents,objRoom,[]);
	array_push(global.persistentEvents[? objRoom],object,xStart,yStart,objLayer,args);
}

function eventAddObjectDefault(xStart,yStart){
	eventAddObject(object_index,room,xStart,yStart,layer_get_name(layer),[]);
}