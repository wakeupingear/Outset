image_speed=0;

active=true;
if layer!=-1&&string_pos("inactive",string_lower(layer_get_name(layer)))>0 active=false;
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
			parts[i]=particle(xstart+lengthdir_x(_dist,_ang),ystart+lengthdir_y(_dist,_ang),i,sprite_index,i+1,{
				fade: 0,
				dir: _ang,
				spd: _spd,
				angSpd: 2*sign(_spd),
			});
			parts[i].image_xscale=image_xscale;
			parts[i].image_yscale=image_yscale;
			parts[i].image_angle=image_angle;
}