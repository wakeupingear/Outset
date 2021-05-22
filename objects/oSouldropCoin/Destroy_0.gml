/// @description Save collection
if sprite_index==sSouldropCoin
{
	ds_list_add(global.souldropCollect,cID);
	global.souldrop+=value;
	checkSouldrop();
}