/// @description Draw
var _num=8;
for (var i=0;i<_num;i++){
	var _ang=direction+i*360/_num;
	particle(x,y,depth+1,sDiscoballRay,1,{
		angle: _ang,
		fade: 0.25,
		alpha: image_alpha
	});
	draw_sprite_ext(sDiscoballRay,1,x,y,1,1,_ang,-1,image_alpha);
}
draw_sprite_ext(sDeathCircle,0,x,y,0.4,0.4,
	-innerAng,
	merge_color(c_white,c_black,0.2),0.8*image_alpha
);
draw_outline(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha,c_white,true);