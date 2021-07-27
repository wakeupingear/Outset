image_speed=0
hit=instance_create_depth(x,y,depth,oSave);

scanVars();
alreadyActive=isScanned;

scanFunc=function(){
	addData("reacSt");
	instance_activate_object(oSouldropCoin);
	var _c=instance_create_layer(0,0,"bg2",oSouldropRainController);
	_c.alarm[1]=1;
}