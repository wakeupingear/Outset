// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroyArray(arr,flag){
	if is_undefined(flag) flag=true;
	for (var i=0;i<array_length(arr);i++)
	{
		if instance_exists(arr[i]) instance_destroy(arr[i],flag);
	}
}