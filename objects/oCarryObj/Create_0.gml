image_speed=0;

args=[];
key="carry"+capitalizeFirstLetter(sprite_get_name(sprite_index));

argsSet=false;
num=instance_number(oCarryObj)-1;
checkArgs=function(){if array_length(args)==0 args=[sprite_index,image_index,image_xscale,image_yscale,image_angle,image_speed,num];}