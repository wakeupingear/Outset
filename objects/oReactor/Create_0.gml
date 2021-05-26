savePoint=instance_place(x,y,oSave);
scanVars();
isScanned=isTest;
alreadyActive=isScanned;

scanFunc=function(){
	addData("reacSt");
	instance_activate_object(oSouldropCoin);
	var _c=instance_create_layer(0,0,"bg2",oSouldropRainController);
	_c.alarm[1]=1;
}