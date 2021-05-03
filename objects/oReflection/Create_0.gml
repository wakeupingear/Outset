if !instance_exists(oReflectionController) 
{
	if layer!=-1 instance_create_depth(0,0,layer_get_depth(layer)-3,oReflectionController);
	else instance_create_depth(0,0,depth-1,oReflectionController);
}

inRange=false;
yAxis=y-image_yscale;
myReflectObj=[];