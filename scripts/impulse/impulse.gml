function impulse(hsp,vsp,obj){
	if hsp!="hsp"&&hsp!=0 
	{
		with obj //needs to affect all objects if it's an object_index
		{
			id.hsp=hsp;
			xscale=sign(hsp);
		}
	}
	if vsp!="vsp"&&vsp!=0 with obj id.vsp=vsp;
}