image_alpha=0;

destroy=false;
mode=global.controllerConnected||true;
var _labels=textLoad("controls");
for (var i=0;i<global.numOfInputs;i++)
{
	var _key=instance_create_depth(0,20+(i%(global.numOfInputs/2))*26,depth-1,oPauseControllerInput);
	_key.parent=id;
	with _key
	{
		pos=i;
		text=_labels[i];
		textWidth=string_width(text);
		image_xscale=textWidth/guiX()/sprite_width*image_xscale+0.4;
		controllerScreenOff=round(sprite_get_width(sprite_index)*image_xscale/2);
		mode=parent.mode;
		
		inputs=array_create(4,[-1,-1]);
		inputs[control.up][1]=i-1;
		inputs[control.down][1]=i+1;
		if i==0 
		{
			_key.selected=true;
			inputs[control.up][1]=global.numOfInputs-1;
		}
		else if i==global.numOfInputs-1
		{
			inputs[control.down][1]=0;
		}
	}
}

draw=function(_x,_y){ //parameters not necessary
	if mode draw_sprite_ext(sprite_index,image_index,x,y+(1-image_alpha)*32,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
}