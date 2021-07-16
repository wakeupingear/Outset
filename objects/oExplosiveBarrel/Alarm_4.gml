/// @description Flash
flash=!flash;
flashTime-=6;
if flashTime>0
{
	alarm[4]=flashTime;
}
else instance_destroy();