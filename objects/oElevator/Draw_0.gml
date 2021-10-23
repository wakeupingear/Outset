/// @description Draw
draw_self();
if down=="1"&&up=="1" draw_sprite(sprite_index,10,x,y);
else if down=="1" draw_sprite(sprite_index,9,x,y);
else if up=="1" draw_sprite(sprite_index,8,x,y);