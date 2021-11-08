if !hasData("factoryAssembly"){
	instance_destroy();
	exit;
}
objs=[oExplosiveBarrel];
conditionFunc=function(){
	return (roomHasPower("factory")&&!instance_exists(oExplosiveBarrel));
}