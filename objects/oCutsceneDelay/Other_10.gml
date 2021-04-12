/// @description Trigger
if scr==-1||script_execute(scr) 
{
	if force
	{
		if is_string(key) conversationForced(textLoad(key));
		else conversationForced(key);
	}
	else 
	{
		if is_string(key) conversation(textLoad(key));
		else conversation(key);
	}
}
instance_destroy();