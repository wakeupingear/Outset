function scrAirChange(){
	var _val=hasData("airChange");
	with oAirChangeParent{
		on=(state==_val);
		toggleFunc();
	}
}