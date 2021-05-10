/// @description Win check
var _cl=ds_list_create();
instance_place_list(x,y,oCard,_cl,false);
var _allStacked=true;
for (var i=0;i<ds_list_size(_cl);i++)
{
	var _i=_cl[|i];
	if !_cl.moving&&place_meeting(x,y,_i)
	{
		_allStacked=false;
		break;
	}
}
show_message(_allStacked)
if _allStacked
{
	conversation("solitaire_win");
	oPopup.mode=-2;
	instance_destroy();
}
ds_list_destroy(_cl);