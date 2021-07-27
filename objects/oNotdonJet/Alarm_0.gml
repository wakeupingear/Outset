/// @description Check event
landingYscale=!flying;
hit.image_index=state;
var _args=[flying,state];
if !eventExists(object_index,startroom,xstart,ystart,layer_get_name(layer),_args) eventAddObject(object_index,startroom,xstart,ystart,layer_get_name(layer),_args);