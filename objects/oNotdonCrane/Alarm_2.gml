/// @description Rotate back down
image_angle+=0.5;
if image_angle<-30 alarm[2]=1;
else
{
	instance_destroy(oWrenchCountdown);
	shake(2,2,20);
	addData("craneFlip");
	conversation(textLoad("pro_haroldCraneSuccess"));
}