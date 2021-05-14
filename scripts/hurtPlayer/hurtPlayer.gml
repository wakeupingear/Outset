

function hurtPlayer(newDamage,newHsp,newVsp){
	if ply.alarm[0]==-1&&!global.transitioning&&(!instance_exists(oTextbox)||oTextbox.image_alpha<1){
	//damage numbers go here
	global.plyHealth-=newDamage;
	resetGrapple();
	if global.plyHealth<=0 killPlayer();
	else 
	{
		if newHsp=="-" newHsp=-max(ply.hsp,3);
		if newVsp=="-" newVsp=-max(ply.vsp,2);
		impulse(newHsp,newVsp,ply);
		ply.alarm[0]=global.damageTime;
		ply.image_blend=c_red;
	}
	}
}