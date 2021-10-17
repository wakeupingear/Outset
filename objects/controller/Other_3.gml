/// @description Delete persistant objects + Save prefs
with all if persistent instance_destroy();
if global.controllerConnected gamepad_set_vibration(global.controllerSlot,0,0);

savePrefs();