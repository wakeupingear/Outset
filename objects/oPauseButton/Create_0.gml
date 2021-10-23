image_speed=0;
image_yscale=0.8;
key="";
text="";
labels=[];
choice=0;
choiceXscale=0;
choiceStr="";
type="toggle";
struct={};
width=0;
next=-1;
previous=-1;
justSelected=false;
selected=false;
active=true;
slideProg=0;
slideIn=0;
destroy=false;
selectedSlide=0;
scaleDiff=random_range(1,1.8);

clickEffect=function(){
	rumbleStart(rumbleType.lighterPulse);
	var _p=particle(x,y,depth+1,sprite_index,0,{
		xscale: image_xscale,
		yscale: image_yscale,
		fade:0.05,
		isBG: true, xOff: x, yOff:y,
		xscaleSpd:0.05,
		yscaleSpd:0.05,
		alwaysMove: true,
		alpha: global.hudAlpha,
		hsp: buttonPressed(control.right)-buttonPressed(control.left),
		isBG: true,
		blend: merge_color(global.hudColorList[global.hudColor],c_white,0.5)
	});
}

setChoiceXscale=function(){
	choiceXscale=string_width(choiceStr)/guiX()/sprite_width*image_xscale+0.4;
}

draw=function(_x,_y){
	var _a=(1-slideProg*0.5-(1-slideIn))*global.hudAlpha;
	var _off=270*scaleDiff*twerp(TwerpType.linear,0,1,slideProg)-160*twerp(TwerpType.linear,1,0,slideIn);
	x=192-(_off+selectedSlide)*(1-(global.hudSide)*2);
	draw_sprite_ext(sprite_index,0,x+_x,y+_y,image_xscale,image_yscale,0,global.hudColorList[global.hudColor],_a);
	if type=="slider"||choiceStr!=""
	{
		draw_sprite_ext(sPauseButton,0,x+round(sprite_width/2)+_x+4+sprite_width/image_xscale*choiceXscale/2,y+_y,choiceXscale,image_yscale,0,global.hudColorList[global.hudColor],_a);
	}
	else if type=="toggle" 
	{
		draw_sprite_ext(sHudSelect,0,x+round(sprite_width/2)+_x+12,y+_y,1,1,0,global.hudColorList[global.hudColor],_a);
		if choice draw_sprite_ext(sHudSelect,1,x+_x+round(sprite_width/2)+12,y+_y,1,1,0,c_white,_a);
	}
}