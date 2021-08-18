/// @description Set event
checkArgs();
sprite_index=args[0];
image_index=args[1];
image_xscale=args[2];
image_xscale=args[3];
image_angle=args[4];
if !eventExists(object_index,startroom,x,y,layer,args) eventAddObject(object_index,startroom,x,y,layer,args);