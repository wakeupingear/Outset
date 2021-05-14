

function touching(object,positionsOPTIONAL){
	if argument_count==1 return place_meeting(x,y,object);
	else
	{
		if place_meeting(x,y,object) return true;
		for (var i=0;i<array_length(positionsOPTIONAL);i+=2) if place_meeting(x+positionsOPTIONAL[i],y+positionsOPTIONAL[i+1],object) return true;
		return false;
	}
}