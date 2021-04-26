function buttonPressed(input){
	return (global.inputs[input]==1);
	//return inputdog_pressed(global.inputs[input*2])||inputdog_pressed(global.inputs[input*2+1])
	return false;
}

function buttonHold(input){
	return (global.inputs[input]>0);
	//return inputdog_down(global.inputs[input*2])||inputdog_down(global.inputs[input*2+1])
	return false;
}

function buttonReleased(input){
	return (global.inputs[input]==0&&global.lastInputs[input]>0);
}

function anyButtonPressed(){
	for (var i=0;i<array_length(global.inputs);i++) if global.inputs[i]==1 return true;
	return false;
}

function buttonFreeze(input){
	global.inputs[input]=-1;
}