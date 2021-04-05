function conversation(textData){
	
	global.menuOpen=true;
	if instance_exists(oTextbox)&&oTextbox.mode>-1 var _t=instance_find(oTextbox,0);
	else var _t=instance_create_depth(120,150,-1005,oTextbox);
	if is_string(textData) textData=textLoad(textData);
	var _oLen=array_length(_t.text);
	_t.text=array_combine(_t.text,textData);
	_t.diag=_oLen;
	try if object_is_ancestor(object_index,npc)&&variable_struct_exists(global.characters,npcKey)
	{
		_t.character=npcKey;
		if pathfinding pathfindingInterrupt=true;
	}
	catch(_exception) show_debug_message("Error: npcKey not defined for object "+object_get_name(object_index));
	
	with _t event_perform(ev_step,ev_step_begin);
}