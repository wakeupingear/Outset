/// @description Set target
if target!=previousTarget
{
	if instance_exists(previousTarget) previousTarget.vspMax=previousVspMax;
	previousTarget=target;
	if instance_exists(target) 
	{
		previousVspMax=target.vspMax;
		target.vspMax=2;
	}
}

if alarm[2]==-1&&place_meeting(x,y,oExplosion)
{
	image_index++;
	alarm[2]=30;
	myHealth--;
}
if myHealth<1
{
	instance_destroy();
}

if target!=-1
{
	if !instance_exists(target) instance_destroy();
	else
	{
		
	}
}