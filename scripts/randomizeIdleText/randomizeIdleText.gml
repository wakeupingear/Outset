

function randomizeIdleText(text,object){
	if array_length(text)==1 return text[0];
	else 
	{
		var _sent=object.lastSentence;
		while _sent==object.lastSentence _sent=irandom(array_length(text)-1);
		object.lastSentence=_sent;
		return text[_sent];
	}
}