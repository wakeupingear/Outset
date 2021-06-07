/// @description Close
image_angle+=90/time;
if image_angle>=0
{
	image_angle=0;
	shake(1,1,10);
	alarm[2]=30;
}
else alarm[1]=1;