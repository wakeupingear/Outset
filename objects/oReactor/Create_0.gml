savePoint=instance_place(x,y,oSave);
scanVars();

scanFunc=function(){
	addData("reacSt");
	instance_activate_object(oSouldropCoin);
	instance_create_layer(0,0,"bg2",oSouldropRainController);
}