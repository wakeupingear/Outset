image_speed=0;
seethroughAlpha=0;
seethroughOverride=0; //0=default, -1=invisible, 1=visible
seethrough=instance_create_layer(x,y,"above",oPlaceholder);
seethrough.sprite_index=sprite_index;
seethrough.image_index=3;
seethrough.xOff=seethrough.x-x;
seethrough.yOff=seethrough.y-y;
landingYscale=1;

hit=instance_create_depth(x,y,depth,hitobj);
hit.sprite_index=sNotdonJetColl;
hit.xOff=0;
hit.yOff=0;

cockpitCheck=instance_create_depth(x+50,y-25,depth-3,oInteractable);
cockpitCheck.key="notdon_jetEmpty";
cockpitCheck.image_xscale=20;
cockpitCheck.image_yscale=20;

followObjs=[seethrough,hit,cockpitCheck];

chairs=array_create(6);
for (var i=0;i<array_length(chairs);i++)
{
	var _c=instance_create_layer(x+10-i*10,y-4,"people",oChairNotdon);
	chairs[i]=[_c];
	array_push(followObjs,_c);
}
chairData=array_create(array_length(chairs),[0,-1]);
sitMode="";

lastXTo=x;
lastYTo=y
xTo=x;
yTo=y;
maxSpd=3;
spd=0;
acc=0.1;
flying=false;
state=0 //0=normal
startroom=room;
if startroom==rStartup startroom=rNotdon;

setState=function(){args=[flying,state,chairData,seethroughOverride,cockpitCheck.key,image_xscale,sitMode];}; //it's like a react state! hahahaha why has god abandoned us
setState();

switchRoom=function(xPos,yPos,newRoom,snap,destroy){
	eventRemove(object_index,startroom,x,y,layer,args);
	setState();
	eventAddObject(object_index,newRoom,xPos,yPos,layer,args);
	if destroy 
	{
		args=[]; //we want the destroy event to fire but don't want to remove the new event
		instance_destroy();
	}
	if room==newRoom&&snap 
	{
		x=xPos;
		y=yPos;
	}
}

if global.notdonEra==notdonEras.present alarm[0]=1;