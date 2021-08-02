/// @description Check event
flying=args[0];
state=args[1];
chairData=args[2];
seethroughOverride=args[3];
cockpitCheck.key=args[4];
image_xscale=args[5];
sitMode=args[6];
pullPlayer=args[7];
with cockpitCheck event_perform(ev_alarm,0);

landingYscale=!flying;
hit.image_index=state;
for (var i=0;i<array_length(chairData);i++)
{
	chairs[i][0].image_index=chairData[i][0];
	chairs[i][0].text=chairData[i][1];
}

if !eventExists(object_index,startroom,x,y,layer,args) eventAddObject(object_index,startroom,x,y,layer,args);

for (var i=0;i<array_length(followObjs);i++)
{
	var _c=followObjs[i];
	_c.xOff=_c.x-x;
	_c.yOff=_c.y-y;
	_c.xscaleSign=_c.image_xscale;
	_c.yscaleSign=_c.image_yscale;
}