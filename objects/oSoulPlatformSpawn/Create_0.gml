if !variable_instance_exists(id,"active") 
{
	alarm[1]=1;
	with object_index active=(!global.alive);;
}

children=[];

parentPlat=-1;