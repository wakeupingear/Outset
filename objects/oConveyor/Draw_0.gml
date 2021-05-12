draw_sprite_ext(spr,image_index,x,y,1,1,0,image_blend,image_alpha);
for (var i=x+sprW;i+12<x+image_xscale;i+=sprW) draw_sprite_ext(spr,image_index+4,i,y,1,1,0,image_blend,image_alpha);
draw_sprite_ext(spr,((image_index+2) mod 4),x,y+image_yscale,1,1,90,image_blend,image_alpha);
for (var i=y+sprH*2;i<y+image_yscale;i+=sprH) draw_sprite_ext(spr,((image_index+2) mod 4)+4,x,i,1,1,90,image_blend,image_alpha);
draw_sprite_ext(spr,((image_index+2) mod 4),x+image_xscale,y,1,1,270,image_blend,image_alpha);
for (var i=y+sprH;i+12<y+image_yscale;i+=sprH) draw_sprite_ext(spr,((image_index+2) mod 4)+4,x+image_xscale,i,1,1,270,image_blend,image_alpha);
draw_sprite_ext(spr,image_index,x+image_xscale,y+image_yscale,1,1,180,image_blend,image_alpha);
for (var i=x+sprW*2;i<x+image_xscale;i+=sprW) draw_sprite_ext(spr,image_index+4,i,y+image_yscale,1,1,180,image_blend,image_alpha);