/// @description Set Scale stuff
//leftBar.image_xscale=image_xscale;
var _dir=1;
if image_index==4 _dir=-1;
leftBar.xDir=-3*_dir;
leftBar.image_index=image_index+1;
//rightBar.image_xscale=image_xscale;
rightBar.image_index=image_index+2;
rightBar.xDir=3*_dir;