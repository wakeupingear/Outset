

function playSound(sound,loops){
	if string_pos("snd",audio_get_name(sound))>0 audio_play_sound(sound,1,loops)
	else audio_play_sound(sound,5,loops)
}