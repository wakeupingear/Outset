layers=[];
var _a=layer_get_all();
for (var i=0;i<array_length(_a);i++)
{
	if layer_get_visible(_a[i])&&string_contains(layer_get_name(_a[i]),"bread")
	{
		array_push(layers,_a[i]);
	}
}
amp=1;
vars=new oscillateVars(4,amp);