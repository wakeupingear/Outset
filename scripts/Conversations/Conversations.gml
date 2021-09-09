function conversation(textData){
	var _alreadyOpen=global.menuOpen;
	global.menuOpen=true;
	if instance_exists(oTextbox)&&oTextbox.mode>-1 var _t=instance_find(oTextbox,0);
	else var _t=instance_create_depth(120,150,-1005,oTextbox);
	var _canStart=true;
	for (var i=0;i<instance_number(oTextbox);i++) if !instance_find(oTextbox,i).mustTouch
	{
		_canStart=false;
		break;
	}
	
	if _canStart
	{
		if is_string(textData) textData=textLoad(textData);
		var _oLen=array_length(_t.text);
		_t.text=array_combine(_t.text,textData);
		_t.diag=_oLen;
		_t.trackObj=id;
		try if object_is_ancestor(object_index,npc)
		{
			if variable_struct_exists(global.characters,npcKey)
			{
				_t.character=npcKey;
				if pathfinding pathfindingInterrupt=true;
			}
		}
		catch(_exception) show_debug_message("Error: npcKey not defined for object "+object_get_name(object_index));
	
		with _t event_perform(ev_step,ev_step_begin);
		if !_alreadyOpen&&_t.mode<0 global.menuOpen=false;
	}
	
	if global.menuOpen rumbleStart(rumbleType.lightPulse);
}

function conversationForced(textData){
	var _alreadyOpen=global.menuOpen;
	global.menuOpen=true;
	var _t=instance_create_depth(120,150,-1005,oTextbox);
	if is_string(textData) textData=textLoad(textData);
	_t.text=textData;
	try if object_is_ancestor(object_index,npc)&&variable_struct_exists(global.characters,npcKey)
	{
		_t.character=npcKey;
		if pathfinding pathfindingInterrupt=true;
	}
	catch(_exception) show_debug_message("Error: npcKey not defined for object "+object_get_name(object_index));
	
	with _t event_perform(ev_step,ev_step_begin);
	if !_alreadyOpen&&_t.mode<0 global.menuOpen=false;
	
	if global.menuOpen rumbleStart(rumbleType.lightPulse);
}

