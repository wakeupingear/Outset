///@description Inputs, Screen, Dev

//process inputs
array_copy(global.lastInputs,0,global.inputs,0,array_length(global.inputs));
if !instance_exists(oDebugCommandLine)&&window_has_focus() for (var i=0;i<global.numOfInputs;i++)
{
	var _isPressed=false;
	
	if i==control.confirm&&mouse_check_button(mb_left) _isPressed=true; //mouse exception
	
	if !_isPressed for (var k=0;k<array_length(global.keyboardInputs[i]);k++)
	{
		if keyboard_check(global.keyboardInputs[i][k])
		{
			_isPressed=true;
			break;
		}
	}
	if global.controllerConnected&&!_isPressed for (var k=0;k<array_length(global.controllerInputs[i]);k++)
	{
		if gamepadPressed(global.controllerInputs[i][k])
		{
			_isPressed=true;
			break;
		}
	}
	
	if !_isPressed 
	{
		if global.inputs[i]>0 global.doubleInput[i]=global.doubleInputTime[i];
		else if global.doubleInput[i]>0 global.doubleInput[i]--;
		global.inputs[i]=0;
	}
	else
	{
		if global.inputs[i]!=-1 global.inputs[i]++;
		if global.inputs[i]>1 global.doubleInput[i]=0;
	}
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
	
	if keyboard_check_pressed(191)
	{
		if instance_exists(oDebugCommandLine) instance_destroy(oDebugCommandLine);
		else instance_create_depth(0,0,depth-1000,oDebugCommandLine);
	}
}

//room time
global.roomTime++;

//playtime
if room!=rTitle global.playtime+=round(delta_time);