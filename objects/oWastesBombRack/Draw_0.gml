/// @description Draw
var _ang=image_angle+70;
var _dist=96;
if mode>-1&&image_angle!=90 draw_sprite_ext(sExplosiveBarrel,0,x+round(lengthdir_x(_dist,_ang)),y+round(lengthdir_y(_dist,_ang)),1,1,image_angle,-1,1);
draw_self();