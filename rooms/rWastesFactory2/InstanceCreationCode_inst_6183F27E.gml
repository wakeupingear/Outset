objs=[oExplosiveBarrel];
conditionFunc=function(){
	return (roomHasPower("factory")&&!instance_exists(oExplosiveBarrel));
}