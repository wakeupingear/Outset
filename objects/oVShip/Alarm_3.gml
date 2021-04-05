/// @description Set initial frames
if instance_exists(oVBarrier) with oVBarrier 
{
	oVShip.barriersUp[(image_xscale==1)]=true
	oVShip.barriersPos[(image_xscale==1)]=1;
}