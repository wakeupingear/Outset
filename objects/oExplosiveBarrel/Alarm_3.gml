/// @description Grow radius
radius+=0.02;
if radius>=1
{
	radius=1;
	alarm[4]=flashTime;
}
else alarm[3]=1;