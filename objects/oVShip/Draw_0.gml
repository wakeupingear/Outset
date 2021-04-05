draw_sprite_ext(sprite_index,4,x-48*image_xscale,y,image_xscale,barriersPos[0]*image_yscale,30,-1,1); //left barrier
draw_sprite_ext(sprite_index,4,x+48*image_xscale,y,image_xscale,barriersPos[1]*image_yscale,-30,-1,1); //right barrier

draw_self(); //ship

draw_sprite_ext(sprite_index,lightningFrame,x,y,-image_xscale,image_yscale,0,-1,1); //lightning

draw_sprite_ext(sprite_index,guns[0],x,y,image_xscale,image_yscale,0,-1,1); //left gun
draw_sprite_ext(sprite_index,guns[1],x,y,-image_xscale,image_yscale,0,-1,1); //right gun