function capitalizeFirstLetter(str){
	var _str2 = string_char_at(str, 1); // return the first character of the string
	_str2 = string_upper(_str2);    // make the character uppercase

	str = string_delete(str, 1, 1);   // delete the first (lowercase) character
	return string_insert(_str2, str, 1) // insert the uppercase character into the original string
}