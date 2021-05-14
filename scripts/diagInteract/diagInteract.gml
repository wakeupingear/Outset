

function diagInteract(){
	if !global.menuOpen&&!global.transitioning&&distance_to_object(ply)<64&&(ply.state==moveState.standing||ply.state==moveState.running)
	{
		var _alreadyTalking=false;
		for (var i=0;i<instance_number(oTextbox);i++)
		{
			if instance_find(oTextbox,i).trackObj==id{
				_alreadyTalking=true;
				break;
			}
		}
		if !_alreadyTalking&&(touching(ply,[0,0])||(object_is_ancestor(object_index,npc)&&touching(ply,[round(sprite_width*xscale*0.75),0])))
		{
			global.interactText=check;
			if buttonPressed(control.up)||buttonPressed(control.confirm)
			{
				if is_array(text[0]) //randomize
				{
					conversation(randomizeIdleText(text,id));
				}
				else conversation(text);
				if object_is_ancestor(object_index,npc)
				{
					try if !is_undefined(pathfinding)&&pathfinding pathfindingInterrupt=true;
					catch(_exception) show_debug_message("Error: Invalid pathfinding check");
				}
			}
		}
	}
}