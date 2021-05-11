/// @description Win check
var _cl=ds_list_create();
instance_place_list(x,y,oCard,_cl,false);
var _allStacked=true;
for (var i=0;i<ds_list_size(_cl);i++)
{
	var _i=_cl[|i];
	if !_i.moving&&place_meeting(x,y,_i)
	{
		_allStacked=false;
		break;
	}
}
if _allStacked||true
{
	conversation("solitaire_win");
	oPopup.exiting=true;
}
ds_list_destroy(_cl);