function loadStringJson(file) {
	if !isHtml
	{
		if !file_exists(file+".hat")
		{
			show_message("Error: File "+file+" does not exist.");
			exit;
		}
		var JsonFile = file_text_open_read(file+".hat");
		var data = "";

		// Read through the Json file and save the text in the Data variable
		while (!file_text_eof(JsonFile)) {
		    data += file_text_read_string(JsonFile);
		    file_text_readln(JsonFile);
		}

		// Close the Json file
		file_text_close(JsonFile);
		addJsonData(file,json_parse(data));
	}
	else
	{
		var _size=131072; //128 KB
		if !ds_exists(fileLoadMap,ds_type_map) fileLoadMap=ds_map_create();
		if !ds_exists(fileLoadBuffers,ds_type_map) fileLoadBuffers=ds_map_create();
		fileLoadBuffers[? file]=buffer_create(_size,buffer_string,0);
		var _loadID=buffer_load_async(fileLoadBuffers[? file],file+".hat",0,_size);
		ds_map_add(fileLoadMap,_loadID,file);
	}
}

function addJsonData(str,data){
	if str=="pathfinding" global.pathfindingScripts=data;
	else global.langScript=addToStruct(global.langScript,data);
}