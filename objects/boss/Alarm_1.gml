/// @description Start cutscene
var _n=object_get_name(object_index);
if !hasData(_n+"Intro")
{
	if is_array(startCutscene)&&array_length(startCutscene)==0
	{
		addData(_n+"Intro");
		enemActive=true;
	}
	else conversation(startCutscene);
}
else if hasData(_n+"IntroFinish") enemActive=true;