// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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