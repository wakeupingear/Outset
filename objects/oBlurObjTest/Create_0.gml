addBlurObj(id);
addReflectObj(id);

drawExt=function(spr,ind,xOff,yOff,xs,ys,ang,blend,alpha){
	draw_sprite_ext(spr,ind,x+xOff,y+yOff,xs*image_xscale,ys*image_yscale,ang,blend,alpha);
}

draw=function(){
	draw_self();
}