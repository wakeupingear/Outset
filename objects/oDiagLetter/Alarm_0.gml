/// @description Fade out
alarm[1]=-1;
image_alpha-=0.3;
if image_alpha<=0 instance_destroy();
else alarm[0]=1;