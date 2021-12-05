/// @description Remove
image_alpha-=0.2;
y-=2;
if image_alpha<=0 instance_destroy();
alarm[0]=1;