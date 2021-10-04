function toGameTime(time){
	var _minutes=ceil(time/1000000/60);
	if _minutes>59
	{
		return string(_minutes%60)+"h "+string(_minutes div 60)+"m";
	}
	else return string(_minutes)+"m";
}