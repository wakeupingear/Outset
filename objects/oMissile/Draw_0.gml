if scope
{
	if scopeAlpha<0.5 scopeAlpha+=0.1;
	draw_sprite_ext(sMissileTrail,0,x,y,1,1,image_angle,scopeBlend[image_index],scopeAlpha);
}
draw_self();