/// @description Set next popup to be original
oPopup.original=true;

if objs!=-1 for (var i=0;i<ds_list_size(objList);i++)
{
	if instance_exists(objList[|i]) instance_destroy(objList[|i]);
}