// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function diagInteract(){
	if !global.menuOpen&&!global.transitioning&&distance_to_object(ply)<64&&(ply.state==moveState.standing||ply.state==moveState.running)&&touching(ply,[round(sprite_width*xscale*0.75),0])
	{
		global.interactText=check;
		if buttonPressed(control.up)||buttonPressed(control.confirm)
		{
			if is_array(text[0]) //randomize
			{
				conversation(randomizeIdleText(text,id));
			}
			else conversation(text);
			try if !is_undefined(pathfinding)&&pathfinding pathfindingInterrupt=true;
			catch(_exception) show_debug_message("Error: Invalid pathfinding check");
		}
	}
}