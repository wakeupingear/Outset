/// @description HTML file loading
if !isHtml exit;
var _id=async_load[? "id"];
if !ds_map_exists(fileLoadMap,_id)
{
	show_debug_message("ERROR: Unkown Async load");
}
else
{
	var _file= fileLoadMap[? _id];
	ds_map_delete(fileLoadMap,_id);
	if ds_map_empty(fileLoadMap) ds_map_destroy(fileLoadMap);
	var _str=buffer_read(fileLoadBuffers[? _file],buffer_string);
	ds_map_delete(fileLoadBuffers,_file);
	if ds_map_empty(fileLoadBuffers) ds_map_destroy(fileLoadBuffers);
	addJsonData(file,json_parse(_str));
}