image_speed=0;
seethroughAlpha=0;
seethroughOverride=0; //0=default, -1=invisible, 1=visible
seethrough=instance_create_layer(x,y,"above",oPlaceholder);
seethrough.sprite_index=sprite_index;
seethrough.image_index=3;
seethrough.xOff=seethrough.x-x;
seethrough.yOff=seethrough.y-y;
landingYscale=1;

moveCommand=-1;
pfInd=0;
pfWait=0;

saveEvent=true; //whether this should be an event object

hit=instance_create_depth(x,y,depth,hitobj);
hit.sprite_index=sNotdonJetColl;
hit.xOff=0;
hit.yOff=0;

finGrapple=instance_create_depth(x-23,y-33,depth,grappleHit);
finGrapple.image_xscale=-18;
finGrapple.image_yscale=10;

cockpitCheck=instance_create_depth(x+50,y-25,depth-3,oInteractable);
cockpitCheck.key="notdon_jetEmpty";
cockpitCheck.image_xscale=20;
cockpitCheck.image_yscale=20;
cockpitCheck.onlyAlive=true;

followObjs=[seethrough,hit,cockpitCheck,finGrapple];

chairs=array_create(6);
for (var i=0;i<array_length(chairs);i++)
{
	var _c=instance_create_depth(x+10-i*10,y-4,layer_get_depth(layer_get_id("people"))+1,oChairNotdon);
	chairs[i]=[_c]; //idk why I made this a 1 length array but it's fineeeeeee
	array_push(followObjs,_c);
}
chairData=array_create(array_length(chairs),[0,-1]);
sitMode="";

lastXTo=x;
lastYTo=y
xTo=x;
yTo=y;
spawnX=x;
spawnY=y;
maxSpd=3;
spd=0;
acc=0.1;
flying=false;
state=0 //0=normal, -1=almost done, -2=in progress, 1=on fire
startroom=room;
if startroom==rStartup startroom=rNotdon;

plyRiding=false;
plyXOff=-100;
plyYOff=-100;
startAng=image_angle;

setState=function(){args=[flying,state,chairData,seethroughOverride,cockpitCheck.key,image_xscale,sitMode,plyRiding,startAng];}; //it's like a react state! hahahaha why has god abandoned us
setState();
fireSystem=-1;
fireEmitter=-1;
firePart=-1;
destroyParts=function(){
	if part_system_exists(fireSystem) part_system_destroy(fireSystem);
	if part_emitter_exists(fireSystem,fireEmitter) part_emitter_destroy(fireSystem,fireEmitter);
	if part_type_exists(firePart) part_type_destroy(firePart);
}

setChairs=function(){
	for (var i=0;i<array_length(chairData);i++)
	{
		chairs[i][0].image_index=chairData[i][0];
		chairs[i][0].text=chairData[i][1];
	}
}

switchRoom=function(xPos,yPos,newRoom,snap,destroy){
	if saveEvent eventRemove(object_index,startroom,spawnX,spawnY,layer,args);
	setState();
	if saveEvent eventAddObject(object_index,newRoom,xPos,yPos,layer,args);
	setChairs();
	spawnX=xPos;
	spawnY=yPos;
	if destroy 
	{
		args=[]; //we want the destroy event to fire but don't want to remove the new event
		instance_destroy();
	}
	if room==newRoom&&snap 
	{
		x=xPos;
		y=yPos;
		xTo=x;
		yTo=y;
	}
}

if global.notdonEra==notdonEras.present||room!=rNotdon alarm[0]=1;