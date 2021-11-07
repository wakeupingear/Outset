function switchConveyors(){
	if hasData("conveyorDir") removeData("conveyorDir");
	else addData("conveyorDir");
	with oConveyorDir 
	{
		setDirection();
		rectangleOutwardParticle(x,y,depth+1,sPlaceholderPixelW,0,1.5,{blend: image_blend,alpha:0.6,fade:0.05});
	}
}