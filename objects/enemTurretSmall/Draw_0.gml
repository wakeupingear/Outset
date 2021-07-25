var _ys=1;
if gunAngle>=90&&gunAngle<=270 _ys=-1;
draw_sprite_ext(sprite_index,0,x,y,xscale,yscale,image_angle,image_blend,image_alpha);
//gpu_set_blendmode(bm_add);
//draw_sprite_ext(sTurretSmallPath,0,x,y,xscale,yscale,image_angle+gunAngle,image_blend,0.5);
//gpu_set_blendmode(bm_normal);
draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale*_ys,image_angle+gunAngle,image_blend,image_alpha);