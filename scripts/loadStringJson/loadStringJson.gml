function loadStringJson(file) {
	if !file_exists(file+".json")
	{
		show_debug_message("Error: File "+file+" does not exist.");
		return -1;
	}
	var JsonFile = file_text_open_read(file+".json");
	var data = "";

	// Read through the Json file and save the text in the Data variable
	while (!file_text_eof(JsonFile)) {
	    data += file_text_read_string(JsonFile);
	    file_text_readln(JsonFile);
	}

	// Close the Json file
	file_text_close(JsonFile);
	return json_parse(data);
}
