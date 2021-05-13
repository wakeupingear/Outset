function impulse(hsp,vsp,obj){
	if hsp!="hsp"&&hsp!=0 
	{
		obj.hsp=hsp;
		obj.xscale=sign(hsp);
	}
	if vsp!="vsp"&&vsp!=0 obj.vsp=vsp;
}