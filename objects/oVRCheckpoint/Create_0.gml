cp=[x+sprite_width/2,y,room,image_xscale];

image_speed=0;
if hasData("vrcp")==false image_index=1;
else image_index=!(array_equals(hasData("vrcp"),cp));