/// @description Move upwards
if instance_exists(leftBar) instance_destroy(leftBar);
if instance_exists(rightBar) instance_destroy(rightBar);
y-=4;
ghostTrail(x,y,3,depth+1,sprite_index,0);
if (y<camY()) instance_destroy();
else alarm[2]=1;