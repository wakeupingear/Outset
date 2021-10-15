/// @description Draw BG
if instance_exists(oPopup)
{
	bgProg=(bgProg+0.25)%sprite_width;
	draw_sprite_repeated(camX()+bgProg-384,camY()-bgProg-216,sprite_index,1,1,1,0,-1,round(oPopup.image_alpha*4)/8,0,0);
	draw_sprite_repeated(camX()+bgProg*2-384,camY()+bgProg*2-216,sprite_index,0,1,1,0,-1,round(oPopup.image_alpha*4)/4,0,0);
}