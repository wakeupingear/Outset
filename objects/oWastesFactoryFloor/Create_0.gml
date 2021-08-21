if hasData("wFFloor") instance_destroy(false);
else 
{
	hit=instance_create_depth(x,y,depth,hitobj);
	hit.image_xscale=image_xscale;
	hit.image_yscale=image_yscale;
}

crack=function(){
	hit.y=-1000;
	alarm[0]=1;
}