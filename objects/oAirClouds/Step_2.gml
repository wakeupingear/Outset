/// @description Extra animation/alpha
if cloudColl()
{
	if fogProg<1 fogProg+=fogSpd;
}
else
{
	if fogProg>0 fogProg-=fogSpd;
}
image_alpha=twerp(TwerpType.inout_cubic,0,fogAlpha,fogProg);