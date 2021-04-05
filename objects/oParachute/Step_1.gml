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

if target!=-1
{
	if !instance_exists(target) instance_destroy();
	else
	{
		
	}
}