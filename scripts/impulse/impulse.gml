// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function impulse(hsp,vsp,obj){
	if hsp!="hsp"&&hsp!=0 
	{
		obj.hsp=hsp;
		obj.xscale=sign(hsp);
	}
	if vsp!="vsp"&&vsp!=0 obj.vsp=vsp;
}