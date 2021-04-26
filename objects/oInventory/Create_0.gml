image_speed=0;
image_blend=global.hudColorList[global.hudColor];
fade=0;

mode=!hasItem("iSlate");
open=true;

surf=-1;
screenSurf=-1;

topLeft=[2];
botRight=[2];

blurFunc=function(){
	draw_sprite(sprite_index,image_index,192,108);
}