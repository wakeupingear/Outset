/// @description Checks to see if a joystick button has been pressed.
/// @param id	the id of the joystick (1 or 2)
/// @param numb The number of the button to check (from 1 to 32).
/// @return {Boolean} true if selected button pressed / false otherwise
function joystick_check_button(argument0, argument1) {
	var jid=__joystick_2_gamepad(argument0);

	var _button = 0;
	switch( argument1 )
	{
	case 0:	_button = gp_face1; break;
	case 1:	_button = gp_face2; break;
	case 2:	_button = gp_face3; break;
	case 3:	_button = gp_face4; break;
	case 4:	_button = gp_shoulderl; break;
	case 5:	_button = gp_shoulderlb; break;
	case 6:	_button = gp_shoulderr; break;
	case 7:	_button = gp_shoulderrb; break;
	case 8:	_button = gp_select; break;
	case 9:	_button = gp_start; break;
	case 10: _button = gp_stickl; break;
	case 11: _button = gp_stickr; break;
	default:
		_button = argument1;
		break;
	}

	return (gamepad_button_value(jid, _button) != 0);


}
