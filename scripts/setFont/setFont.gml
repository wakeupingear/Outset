// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setFont(num){
	draw_set_font(global.fonts[round(global.guiScale*3)-3][num]);
}