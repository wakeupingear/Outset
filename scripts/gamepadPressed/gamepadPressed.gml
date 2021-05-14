

function gamepadPressed(input){
	switch (input)
	{
		case leftStickUp: return (gamepad_axis_value(global.controllerSlot, gp_axislv)<0);
		case leftStickDown: return (gamepad_axis_value(global.controllerSlot, gp_axislv)>0);
		case leftStickLeft: return (gamepad_axis_value(global.controllerSlot, gp_axislh)<0);
		case leftStickRight: return (gamepad_axis_value(global.controllerSlot, gp_axislh)>0);
		default: return gamepad_button_check(global.controllerSlot,input);
	}
}