function addBlurObj(_id){
	ds_list_add(global.blurObj,_id);
	if id==_id
	{
		if !variable_instance_exists(id,"draw") draw=function(){
			draw_self();
		}
	}
}

function addReflectObj(_id){
	ds_list_add(global.reflectObj,_id);
	if id==_id
	{
		if !variable_instance_exists(id,"drawExt") drawExt=function(spr,ind,xOff,yOff,xs,ys,ang,blend,alpha){
			draw_sprite_ext(spr,ind,x+xOff,y+yOff,xs*image_xscale,ys*image_yscale,ang,blend,alpha);
		}
	}
}

function drawEffectObj(list){
	for (var i=0;i<ds_list_size(list);i++) 
	{
		var _i=list[|i];
		if instance_exists(_i) with _i draw();
		else
		{
			ds_list_delete(list,i);
			i--;
		}
	}
}