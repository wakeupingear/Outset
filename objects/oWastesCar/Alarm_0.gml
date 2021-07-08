/// @description Set wheels
if instance_number(oWastesCar)>1&&!args[2] instance_destroy();
else wheels=[
	instance_create_depth(x-18,y+args[0],depth,oWastesCarWheel),
	instance_create_depth(x+18,y+args[1],depth,oWastesCarWheel)
];