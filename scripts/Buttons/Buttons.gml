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

function buttonPressedRepeat(input,holdTime,startOffset){
	if is_undefined(holdTime) holdTime=7;
	if is_undefined(startOffset) startOffset=15;
	var _i=global.inputs[input];
	return _i>0&&(_i==1||(_i>startOffset&&(_i-startOffset)%holdTime==0));
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
function buttonIncrement(input,amount){
	if is_undefined(amount) amount=1;
	global.inputs[input]+=amount;
}

function buttonDoublePressed(input){
	return buttonPressed(input)&&global.doubleInput[input]>0;
}

function getKeyDir(holdTime,startOffset){
	if buttonPressedRepeat(control.up,holdTime,startOffset) return control.up;
	if buttonPressedRepeat(control.down,holdTime,startOffset) return control.down;
	if buttonPressedRepeat(control.left,holdTime,startOffset) return control.left;
	if buttonPressedRepeat(control.right,holdTime,startOffset) return control.right;
	return -1;
}