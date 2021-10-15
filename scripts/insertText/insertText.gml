function insertText(key){
	if is_string(key) key=textLoad(key);
	var _newArray=oTextbox.text;
	for (var i=array_length(key)-1;i>-1;i--) array_insert(_newArray,oTextbox.diag+1,key[i]);
	oTextbox.text=_newArray;
}