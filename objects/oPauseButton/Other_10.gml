/// @description Set choice variable
if is_array(struct) choice=0;
else
{
	type=struct.type;
	if variable_struct_exists(struct,"variable")
	{
	
	}
	else if type!="special" choice=option(key);
}