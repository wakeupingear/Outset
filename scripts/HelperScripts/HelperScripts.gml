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