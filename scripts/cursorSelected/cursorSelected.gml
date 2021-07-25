function cursorSelected(){
	return (selected&&(!instance_exists(oCursor)||!oCursor.justMoved));
}