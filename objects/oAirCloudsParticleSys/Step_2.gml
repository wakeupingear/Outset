/// @description Position emitter
if instance_exists(oAirClouds){
	if place_meeting(x,y,ply)&&oAirClouds.image_alpha>0 image_alpha=min(image_alpha+0.02,1);
	else image_alpha=max(image_alpha-0.02,0);
}
resizeSmoke(image_alpha);
part_emitter_stream(smokeSys,smokeEmitter,smokePart,rate);