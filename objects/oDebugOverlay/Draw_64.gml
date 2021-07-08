/// @description 
x=camX();
y=camY();
surface_set_target(global.guiSurf);
draw_text_outline(toGuiX(x+16),toGuiY(y+68),"FPS: "+string(fps),8,10);
draw_text_outline(toGuiX(x+16),toGuiY(y+82),"RFPS: "+current_fpsReal,8,10);
if memDLL!=-1 draw_text_outline(toGuiX(x+16),toGuiY(y+96),"MEM: "+current_mem,8,10);
surface_reset_target();