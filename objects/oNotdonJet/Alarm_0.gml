/// @description Check event
flying=args[0];
state=args[1];
chairData=args[2];
seethroughOverride=args[3];
cockpitCheck.key=args[4];
image_xscale=args[5];
sitMode=args[6];
pullPlayer=args[7];
startAng=args[8];
image_angle=startAng;
with cockpitCheck event_perform(ev_alarm,0);

landingYscale=!flying;
//hit.image_index=state;
if state<0 hit.sprite_index=empty;
setChairs();

if saveEvent&&!eventExists(object_index,startroom,x,y,layer,args) eventAddObject(object_index,startroom,x,y,layer,args);

for (var i=0;i<array_length(followObjs);i++)
{
	var _c=followObjs[i];
	_c.xOff=_c.x-x;
	_c.yOff=_c.y-y;
	_c.xscaleSign=_c.image_xscale;
	_c.yscaleSign=_c.image_yscale;
}

destroyParts();
if state==1 //fire
{
	fireSystem=part_system_create_layer("water",false);
	ds_list_add(global.particleSystems,fireSystem);
	fireEmitter=part_emitter_create(fireSystem);
	part_emitter_region(fireSystem,fireEmitter,x-72,x+72,y-10,y+10,ps_shape_rectangle,ps_distr_gaussian);
	firePart=part_type_create();
	part_type_sprite(firePart,sDeathCircle,false,false,false);
	part_type_life(firePart,80,100);
	part_type_alpha2(firePart,2,0);
	part_type_scale(firePart,0.02,0.02);
	part_type_gravity(firePart,0.02,90);
	part_type_colour2(firePart,c_red,c_black);
	part_emitter_stream(fireSystem,fireEmitter,firePart,2);
	part_system_automatic_update(fireSystem,false);
}