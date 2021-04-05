// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function impulse(hsp,vsp,obj){
	if hsp!="hsp" 
	{
		obj.hsp=hsp;
		obj.xscale=sign(hsp);
	}
	if vsp!="vsp" obj.vsp=vsp;
}