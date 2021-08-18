/// @description Position
if !argsSet
{
	if array_length(args)==0 checkArgs();
	sprite_index=args[0];
	image_index=args[1];
	xscale=args[2];
	yscale=args[3];
	image_angle=args[4];
	image_speed=args[5];
	num=args[6];
	//I could add a xOff arg that checks existing objects on creation and scales to account for it
	if !eventExists(object_index,"any",0,0,"player",args) eventAddObject(object_index,"any",0,0,"player",args);
	if !hasData(key) addData(key);
	argsSet=true;
}

visible=global.alive;

if instance_exists(ply)
{
	image_xscale=ply.xscale*xscale;
	image_yscale=ply.yscale*yscale;
	x=ply.x-image_xscale*(num+1)*2;
	y=ply.y-(num*16+2)*image_yscale;
}