if audio_get_name(global.music)!=audio_get_name(music)
{
	if st==0
	{
		audio_group_set_gain(audiogroup_music,0,130);
		alarm[0]=1+44*(global.music!=-1);
		st=1;
	}
}
else instance_destroy();