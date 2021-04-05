///@params key
function pathLoad(_key) {
	var _arr=global.pathfindingScripts[$ _key]
	if !is_undefined(_arr)
	{
		//var _len=ds_list_size(_t)
		//var _arr= array_create(_len,0)
		//for (var i=0;i<_len;i++) _arr[i]=_t[|i]
		if array_length(_arr)==1&&is_real(_arr[0]) 
		{
			var _str=string_letters(_key)+string(_arr[0]);
			_arr=textLoad(_str);
		}
		return _arr;
	}
	return ["Error - pathfinding conversation load failed!","end"];
}
