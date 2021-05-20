image_speed=0;
image_blend=global.hudColorList[global.hudColor];
fade=0;
instance_create_depth(camX()+20,camY()+20,depth-1,oCursor);


mode=!hasItem("iSlate");
contentMode=0;
contentText="";
open=true;

surf=-1;
screenSurf=-1;
textInd=0;
doneTyping=false;
hover=0;

topLeft=[2];
botRight=[2];

blurFunc=function(){
	draw_sprite(sprite_index,image_index,192,108);
	if mode==0
	{
		if contentMode==1
		{
			if doneTyping draw_sprite(sprite_index,2+hover,192,108);
		}
	}
}