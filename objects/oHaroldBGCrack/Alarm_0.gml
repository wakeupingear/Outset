/// @description Extend crack
image_index++;
shake(2,2,10+image_index*3);
if image_index<5
{
	alarm[0]=45-image_index*5;
}
else alarm[1]=60;