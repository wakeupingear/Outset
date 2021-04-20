/// @description Rotate fast
image_angle+=4;
if image_angle<150 alarm[3]=1;
else
{
	addData("craneSpin");
	instance_destroy(oWrenchCountdown);
	shake(4,4,20);
	conversation(textLoad("pro_haroldCraneFail"));
}