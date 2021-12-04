/// @description Position particles
event_inherited();
var _dist=((camY()+216)/room_height);
part_emitter_stream(partSys, partEmitter, partType, 6+round(_dist*20));
part_type_speed(partType,0.3+(_dist+oSkyNotdon.vShipTime)*0.5,0.3+(_dist+oSkyNotdon.vShipTime),0,0);
part_type_color1(partType,merge_color(image_blend,merge_color(c_red,c_white,0.4),oSkyNotdon.vShipTime));
part_system_position(partSys,x,y);
if global.alive repeat 1+(global.roomTime==-1)*60 part_system_update(partSys);

/*var _p=particle(camX()+irandom(384),camY()+216+irandom(24),depth,sPlaceholderPixelW,0,{
	alpha:0.1,
	isBG: true,
	xscale: 48,
	yscale: 48,
	spd: 1,
	direction: 90+irandom_range(-20,20),
	fade:0.001,
	alwaysMove: true,
	xLerp:1,
	yLerp:1,
});
with _p setBGPosition(x,y);