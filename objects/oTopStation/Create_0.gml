event_inherited();

hit=instance_create_depth(x,y,depth,grappleHit);
hit.sprite_index=sprite_index;
hit.image_index=1;
hit.image_xscale=image_xscale;
hit.image_yscale=image_yscale;
hit.image_angle=image_angle;

holdingTop=false;

scanVars();
drawScanEffect=function(){
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,global.scanColor,image_alpha);
	draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,global.scanColor,image_alpha);
}