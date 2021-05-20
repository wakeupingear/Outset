savePoint=instance_place(x,y,oSave);
scanVars();

scanFunc=function(){
	addData("reacSt");
	instance_activate_object(oSouldropCoin);
	instance_create_layer(0,0,"bg2",oSouldropRainController);
	instance_create_layer(1194,391,"people",oSouldropCoin);
	instance_create_layer(3088,901,"people",oSouldropCoin);
}