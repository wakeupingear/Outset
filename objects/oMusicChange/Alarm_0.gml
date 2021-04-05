/// @description play new track
audio_stop_sound(global.music);
global.music=audio_play_sound(music,1,true);
audio_group_set_gain(audiogroup_music,global.musicVol,0);