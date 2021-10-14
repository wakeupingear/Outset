/// @description Animate
alarm[0]=45;
if !global.alive exit;
if hasPower image_index=(image_index+1)%(image_number-1);
else image_index=image_number-1;