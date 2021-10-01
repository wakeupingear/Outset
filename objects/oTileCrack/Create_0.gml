image_speed=0;
visible=false;

active=true;
if layer!=-1&&string_pos("active",string_lower(layer_get_name(layer)))!=1 active=false;
lastActive=active;
partSpd=6;
parts=[];
isHit=1;
hit=-1;
alarm[0]=1;
destFrames=[1,sprite_get_number(sprite_index)];

createParticle=function(i,_spd,_dist){
	_dist=min(_dist,440);
	var _ang=(i)/(destFrames[1]-destFrames[0])*360+irandom_range(-22,22);
	parts[i]=particle(xstart+lengthdir_x(_dist,_ang),ystart+lengthdir_y(_dist,_ang),depth+1,sprite_index,i+1,{
		fade: 0,
		dir: _ang,
		spd: _spd,
		angSpd: 2*sign(_spd),
		xscale:image_xscale,
		yscale:image_yscale,
		angle:image_angle,
		ghost: true,
		ghostFrameOffset:6
	});
}