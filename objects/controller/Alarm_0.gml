/// @description Load text files
try
{
	global.pathfindingScripts=loadStringJson("pathfinding");
	global.langScript={};
	var _importTextData=function(name){
		global.langScript=addToStruct(global.langScript,loadStringJson(global.lang+"/"+global.lang+name));
	}
	
	_importTextData("");
	_importTextData("Flavortext");
	_importTextData("Prologue");
	scrSetText();
}
catch(_exception) 
{
	if !isHtml ||true show_error(_exception,true);
	else alarm[0]=30;
}