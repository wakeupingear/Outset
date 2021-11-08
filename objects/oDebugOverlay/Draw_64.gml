/// @description 
x=camX();
y=camY();
surface_set_target(global.guiSurf);
draw_text_outline(toGuiX(x+16),toGuiY(y+68),"FPS: "+string(fps));
draw_text_outline(toGuiX(x+16),toGuiY(y+82),"RFPS: "+current_fpsReal);
if instance_exists(ply) draw_text_outline(toGuiX(x+16),toGuiY(y+96),"PLY: "+string(ply.x)+", "+string(ply.y));
if memDLL!=-1 draw_text_outline(toGuiX(x+16),toGuiY(y+96),"MEM: "+current_mem);
surface_reset_target();