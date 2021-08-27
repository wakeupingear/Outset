function randomizeIdleText(text,object){
	if array_length(text)==1 return text[0];
	else 
	{
		var _options=ds_list_create();
		for (var i=array_length(text)-1;i>=0;i--)
		{
			if is_array(text[i]) ds_list_add(_options,i);
			else if is_real(text[i]){
				repeat text[i] ds_list_add(_options,i-1);
				i--;
			}
		}
		var _sent=object.lastSentence;
		while _sent==object.lastSentence _sent=irandom(ds_list_size(_options)-1);
		object.lastSentence=_sent;
		return text[_options[|_sent]];
	}
}