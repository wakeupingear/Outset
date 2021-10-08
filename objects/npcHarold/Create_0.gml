event_inherited();

drawCycle=0;
drawLight=function(){
	if global.alive drawCycle=(drawCycle+0.01)%1;
	draw_circle(round(x)-camX(),round(y)-camY(),16+sin(drawCycle*2*pi),false);
}