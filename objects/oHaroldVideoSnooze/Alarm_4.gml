/// @description Eye open
if eyeProg>0
{
	eyeProg-=0.025;
	alarm[4]=1;
}
else instance_destroy();