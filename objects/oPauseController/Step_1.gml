/// @description Inputs
if !destroy
{
	if image_alpha<1 image_alpha+=0.2;
}
else
{
	with oPauseControllerInput if !instance_exists(parent)||parent.destroy destroy=true;
	image_alpha-=0.2;
	if image_alpha<=0 instance_destroy();
}