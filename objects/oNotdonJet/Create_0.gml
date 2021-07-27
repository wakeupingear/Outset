image_speed=0;
seethroughAlpha=0;
seethroughOverride=0; //0=default, -1=invisible, 1=visible
landingYscale=1;

hit=instance_create_depth(x,y,depth,hitobj);
hit.sprite_index=sNotdonJetColl;

flying=false;
state=0 //0=normal
startroom=room;
if startroom==rStartup startroom=rNotdon;

if global.notdonEra==notdonEras.present alarm[0]=1;
if room==rStartup event_perform(ev_alarm,0);