

function dropSurroundingObj(arr){
	var _l=ds_list_create();
	for (var i=0;i<array_length(arr);i+=2)
	{
		instance_place_list(x+arr[i],y+arr[i+1],oPhysicsObj,_l,false);
		for (var k=0;k<ds_list_size(_l);k++)
		{
			_l[|k].state=moveState.falling;
		}
	}
	ds_list_destroy(_l);
}