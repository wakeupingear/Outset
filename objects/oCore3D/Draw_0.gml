/// @description Draw background
draw_sprite_repeated(camX()*startXScale,camY()*startYScale,sNotdonTerrainTexture,3,1,1,0,-1,1,0,0);
if instance_exists(oPlayerSoul)
{
	if obj.defaultColor!=redCol
	{
		redProg+=0.01;
		obj.defaultColor=merge_color(c_white,redCol,redProg);
	}
}
var _x=round(startXScale*camX())+startXOff;
var _y=round(startYScale*camY())+startYOff;
draw_sprite_ext(sCoreTerrain,1,_x,_y,smallScale,smallScale,0,-1,1);
event_inherited();