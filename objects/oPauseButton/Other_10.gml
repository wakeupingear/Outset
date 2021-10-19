/// @description Set choice variable
if is_array(struct) choice=0;
else
{
	type=struct.type;
	choice=option(key);
	if type=="toggle" 
	{
		if variable_struct_exists(struct,"labels")
		{
			labels=struct.labels;
			choiceStr=labels[choice];
		}
	}
	else if type=="slider"
	{
		choiceStr=string(round(choice*100))+"%";
	}
}