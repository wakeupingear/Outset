// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pauseAlarms(upToIncluding){
	for (var i=0;i<=upToIncluding;i++) if alarm[i]>0 alarm[i]++;
}