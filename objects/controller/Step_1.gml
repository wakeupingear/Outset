///@description Inputs, Screen, Dev

//process inputs
for (var i=0;i<global.numOfInputs;i++)
{
	if i==control.confirm&&mouse_check_button(mb_left) global.inputs[i]++;
	else if keyboard_check(global.keyboardInputs[i*2])||keyboard_check(global.keyboardInputs[i*2+1]) global.inputs[i]++;
	else if global.controllerConnected&&(gamepadPressed(global.controllerInputs[i*2])||gamepadPressed(global.controllerInputs[i*2+1]))
	{
		global.inputs[i]++;
	}
	else global.inputs[i]=0;
	//controller input processing goes between the if and the else
}

//html resizing
if isHtml
{
	if (browser_width != width || browser_height != height)
    {
	    width = max(base_width, browser_width);
	    height = max(base_height, browser_height);
	    scale_canvas(base_width, base_height, width, height, true);
    }
}
else if buttonPressed(control.fullscreen) window_set_fullscreen(!window_get_fullscreen());

//open inventory
if global.alive&&!global.menuOpen&&!global.transitioning&&global.notPause&&buttonPressed(control.select)
{
	global.menuOpen=true;
	instance_create_depth(ply.x,ply.y,-10001,oInventory);
}

//dev commands
if isDev||isTest
{
	if buttonPressed(control.noclip)&&instance_exists(ply)
	{
		ply.move=0;
		ply.hsp=0;
		ply.vsp=0;
		if ply.state==moveState.floating 
		{
			ply.state=moveState.falling;
			with ply if groundCollision(x,y) 
			{
				while groundCollision(x,y) y--;
				ply.state=moveState.standing;
			}
		}
		else ply.state=moveState.floating;
	}
}

//room time
global.roomTime++;

show_debug_message(DEBUG_getNPCLocation("smitten"));