/// @description Rumble
gamepad_set_vibration(global.controllerSlot,rumble[0],rumble[1]);
if rumble[0]!=0||rumble[1]!=0
{
	if rumble[0]>0  rumble[0]-=rumbleDown[0];
	if rumble[1]>0  rumble[1]-=rumbleDown[1];
	alarm[1]=rumbleStep;
}