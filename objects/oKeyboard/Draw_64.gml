/// @description 
surface_set_target(global.guiSurf)
if instance_exists(oLetter) with oLetter draw_text(toGuiX(x)+xShift,toGuiY(y)+yShift,letter);
setFont(fontSizes.extraLarge);
draw_text(toGuiX(camX()+108)-string_width(str)/2,toGuiY(camY()+32),str);
setFont(fontSizes.medium);
surface_reset_target();