oMouse.mask_index=mask_index;
image_speed=0;

window_mouse_set(window_get_width()*(x-camX())/384,window_get_height()*(y-camY())/216);
mouseXPrevious=x;
mouseYPrevious=y;
justMoved=false;

initialPress=buttonHold(control.confirm);