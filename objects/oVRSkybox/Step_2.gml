/// @description Animate
if global.alive for (i=0;i<array_length(colors);i++)
{
	colors[i]=(colors[i]+0.05)mod 360
}