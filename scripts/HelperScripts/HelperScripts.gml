//array
function array_combine(arr1,arr2){
	var _len1=array_length(arr1);
	var _len2=array_length(arr2);
	for (var i=_len1;i<_len1+_len2;i++) arr1[i]=arr2[i-_len1];
	return arr1;
}

function array_pos(array,val){
	for (var i=0;i<array_length(array);i++) if array[i]==val return i;
	return -1;
}

function array_remove(array,pos,count){
	for (var k=pos+count;k<array_length(array);k++) array[k-count]=array[k];
	array_resize(array,array_length(array)-count);
	return array;
}

//structs
function addToStruct(originalStruct,addStruct){
	var _n=variable_struct_get_names(addStruct);
	for (var i=0;i<array_length(_n);i++)
	{
		originalStruct[$ _n[i]]=addStruct[$ _n[i]];
	}
	return originalStruct;
}

//objects
function destroyArray(arr,flag){
	if is_undefined(flag) flag=true;
	for (var i=0;i<array_length(arr);i++)
	{
		if instance_exists(arr[i]) instance_destroy(arr[i],flag);
	}
}

//string
function explodeString(del,str)
{
    var arr;
   str+=del;
    var len = string_length(del);
    var ind = 0;
    repeat (string_count(del, str)) {
        var pos = string_pos(del, str) - 1;
        arr[ind] = string_copy(str, 1, pos);
        str = string_delete(str, 1, pos + len);
        ind++;
    }
    return arr;
}

//controller
function gp_anykey(slot){
	for (var i=gp_face1; i<gp_axisrv;i++) if gamepad_button_check(slot,i) return true;
	return false;
}

//bitwise
function roundToZero(num){
	num|=0;
	return num;
}