/// @description Draw obj
if obj==-1 
{
	obj=new Obj3D(objSpr,objIndex,frameFunc,alwaysUpdate,num,smallScale,objColor,objAngle,objAlpha,isShaded,drawDir,extraSprites);
}

if startObj<0
{
	var _x=round(startXScale*camX());
	var _y=round(startYScale*camY());
}
else
{
	var _x=startObj.x;
	var _y=startObj.y;
}
_x+=startXOff;
_y+=startYOff;
	
var _hasSpr=(object_get_sprite(id)>-1)
if !_hasSpr||isInRange(x,y) obj.render(_x,_y,x,y);
if _hasSpr draw_self();