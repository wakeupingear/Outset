/// @description Load text files
try
{
	global.pathfindingScripts=loadStringJson("pathfinding");
	global.langScript=loadStringJson(global.lang);
	global.langScript=addToStruct(global.langScript,loadStringJson(global.lang+"Prologue"));
	scrSetText();
}
catch(_exception) 
{
	if !isHtml ||true show_error(_exception,true);
	else alarm[0]=30;
}