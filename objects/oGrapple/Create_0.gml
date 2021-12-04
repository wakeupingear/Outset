///@description Step function goes here
image_alpha=0;

move=0; //unused - compatability with physics objs
state=0;
xDir=0;
yDir=0;
grappleMode=0; //0=normal, 1=swing, 2=arc, 3=down
upgrades=[];
collPointX=[];
grappleAngle=0;

trackList=[oSouldropCoin,oDroppedItem];
dragObj=ds_list_create();

grappleDist=80; //max distance
grappleDistExtra=0;
grappleTime=0; //time that the grapple has been moving/pulling
touchingExtension=false;
grappleReach=3; //final reach distance
grappleSpd=6; //initial movement speed
grapplePlyXoff=3; //starting xoff from player (used when grappling up against a wall to compensate for xorigin)
grapplePlyYoff=3; //starting yoff from player
distIntoWall=6; //dist moved horizontal/vertical into the wall
followObj=-1;
followXOff=0;
followYOff=0;
hitPlace=-1;
hitPlaceMoved=false;
moveHitPlace=function(_x,_y){
	hitPlaceMoved=false;
	if hitPlace!=-1&&instance_exists(hitPlace)
		{
			if place_meeting(_x,_y,hitPlace)
			{
				if hitPlace==oLadder for (var i=0;i<instance_number(oLadder);i++) instance_find(oLadder,i).x-=5000
				else hitPlace.x-=5000;
				hitPlaceMoved=true;
			}
			else hitPlace=-1;
		}
}
resetHitPlace=function(){
	if hitPlaceMoved&&instance_exists(hitPlace) 
	{
		if hitPlace==oLadder for (var i=0;i<instance_number(oLadder);i++) instance_find(oLadder,i).x+=5000
		else hitPlace.x+=5000;
	}
}
tooFar=function(){
	return (distance_to_object(ply)>=grappleDist+grappleDistExtra);
	//return (abs(ply.x-x)>=grappleDist||abs(ply.y-y)>=grappleDist);
}

points=ds_list_create();
pullObj=ds_list_create();
pullObjList=[oDroppedItem];

grappleFireEffect=function(){
	//particle(ply.x,ply.y,depth+1,sNormalRipple,0,{distort: true,xscale:0.1,yscale:0.1,xscaleSpd:0.02,yscaleSpd:0.02,fade:0.15,followObj: ply});
	rumbleStart(rumbleType.lightPulse);
	playSound(sndGrappleFull,false);
	hitPlaceMoved=false;
	if place_meeting(x,y,oLadder) hitPlace=oLadder
	else if place_meeting(x,y,grappleHit) hitPlace=instance_place(x,y,grappleHit);
	else if place_meeting(x,y,npc)&&!place_meeting(x,y,enem) hitPlace=instance_place(x,y,npc);
	else hitPlace=-1;
}

grappleCollideEffect=function(final){
	particle(x,y,depth+1,sNormalRipple,0,{distort: true,xscale:0.1,yscale:0.1,xscaleSpd:0.03 ,yscaleSpd:0.03,fade:0.15,followObj: id, alwaysMove: true});
	var _num=8;
	for (var i=0;i<_num;i++)
	{
		particle(x,y,depth,sPlaceholderPixelW,0,{
			dir: i*360/_num,
			spd: 1,
			xscale: 3,
			yscale: 3,
			alpha: 2,
			fade: 0.15,
			alwaysMove: true
		});
	}
	rumbleStart(rumbleType.lightPulse);
	audio_stop_sound(sndGrappleFull);
	if final
	{
		playSound(sndGrappleTouch,false);
		if instance_exists(followObj)&&isObj(followObj,npc)&&!isObj(followObj,enem)
		{
			with followObj event_user(1);
		}
	}
}

//step event is run by the player as a function to control the exact timing
step=function(){ 
if state==0&&!global.transitioning&&!global.menuOpen //check for inputs
{
	if ply.state==moveState.floating
	{
		if !place_meeting(ply.x,ply.y,oAirShip){
			exit;
		}
	}
	xDir=0;
	yDir=0;
	x=round(ply.x);
	grapplePlyXoff=0;
	y=round(ply.y)+grapplePlyYoff;
	var _onGround=(ply.state<=moveState.running||ply.state==moveState.zipline);
	if buttonPressed(control.grapple)&&(buttonHold(control.up)||buttonHold(control.down))&&!_onGround&&(place_meeting(x,y,grappleHit)||place_meeting(x,y+ply.vsp*2,grappleHit))
	{
		image_index=1;
		grappleAngle=0;
		ply.vsp=-5;
		shake(1,1,10);
		grappleCollideEffect(true);
	}
	else if _onGround||upgrades[4]||(buttonHold(control.down)&&buttonPressed(control.grapple)&&upgrades[grappleState.down])
	{
		if buttonPressed(control.swing)
		{
			if buttonHold(control.up)&&upgrades[grappleState.arc] //arc
			{
				grappleAngle=90;
				state=1;
				xDir=ply.xscale;
				grappleMode=grappleState.arc;
				if groundCollision(x,y) x-=xDir;
			}
			else if upgrades[2] //swing
			{
				state=1;
				xDir=ply.xscale;
				yDir=-1;
				grappleMode=grappleState.swing;
			}
		}
		else if buttonPressed(control.grapple)
		{
			if buttonHold(control.down) //down
			{
				image_index=3;
				if upgrades[grappleState.down]&&(!_onGround||upgrades[4])
				{
					state=1;
					grappleMode=grappleState.down;
					ply.state=moveState.floating;
					ply.hsp=0;
					ply.vsp=0;
					yDir=1;
				}
			}
			else 
			{
				state=1;
				grappleMode=grappleState.pull;
				image_index=1+ply.xscale;
				if buttonHold(control.up) 
				{
					image_index=1;
					if ply.xscale==1
					{
						grapplePlyXoff=-1;
					}
					else 
					{
						grapplePlyXoff=0;
					}
					x+=grapplePlyXoff;
					yDir=-1; //up
				}
				else xDir=ply.xscale; //left/right
				
			}
		}
		
		if state==1
		{
			grappleAngle=0;
			grappleFireEffect();
		}
	}
}
else if state==1 //move in direction
{
	grappleTime++;
	if place_meeting(x,y,oGrappleExtend)
	{
		if !touchingExtension
		{
			var _g=instance_place(x,y,oGrappleExtend);
			if yDir!=0||grappleMode==grappleState.arc y=_g.y;
			else x=_g.x;
			grappleDistExtra+=grappleDist;
			touchingExtension=true;
			grappleTime=0;
			grappleCollideEffect(false);
			playSound(sndGrappleFull,false);
		}
	}
	else touchingExtension=false;
	image_alpha=1;
	if grappleMode==grappleState.arc //arc
	{
		ds_list_add(points,instance_create_depth(x,y,ply.depth+1,oGrapplePoint));
		y+=(grappleTime-24)*0.3;
		var _x=xDir*(grappleTime>11);
		moveHitPlace(x+_x,y);
		if _x==0||sign(yprevious-y)>-1&&!groundCollision(x,y)&&groundCollision(x+_x,y) x=x;
		else x+=_x;
		var _hit=1;
		if place_meeting(x,y,oSpike) _hit=0;
		else if groundCollision(x,y)&&(groundCollision(x-1,y)&&groundCollision(x+1,y))
		{
			if (sign(yprevious-y)<1)&&(!groundCollision(x,yprevious)) _hit=2;
			else _hit=0
		}
		if place_meeting(x,y,npc)||place_meeting(x,y,oPlatform)||place_meeting(x,y,grappleHit)||_hit==2
		{
			grappleSetTracking(x,y);
			state=2;
			grappleTime=0;
		}
		else if grappleTime>46||_hit==0 resetGrapple();
		resetHitPlace();
		grappleAngle=point_direction(xprevious,yprevious,x,y);
	}
	else
	{
		if xDir!=0 repeat grappleSpd
		{
			x+=xDir;
			if groundCollision(x,y) break;
		}
		if yDir!=0 repeat grappleSpd
		{
			y+=yDir;
			if groundCollision(x,y) break;
		}
		var _x=x;
		var _y=y;
		if tooFar()
		{
			_x+=xDir*grappleReach;
			_y+=yDir*grappleReach;
		}
		moveHitPlace(_x,_y);
		if place_meeting(x,y,oSpike) resetGrapple();
		else if (groundCollision(_x,_y)&&(yDir==0||(groundCollision(_x-1,_y)&&groundCollision(_x+1,_y))))||place_meeting(x,y,npc)||place_meeting(x,y,grappleHit)
		{
			grappleSetTracking(_x,_y);
			state=2;
			ply.state=moveState.pulling;
			ply.hsp=0;
			ply.vsp=0;
			grappleTime=0;
			if grappleMode==0
			{
				if xDir==0 ply.vsp=min(ply.vsp,-4);
				else ply.hsp=max(ceil(abs(ply.hsp)),4)*xDir;
			}
			
			if place_meeting(x,y,oConveyor)&&instance_exists(ply) //need to move player off conveyor
			{
				
			}
		}
		else if tooFar()||(yDir==-1&&buttonHold(control.down))//||(xDir==1&&buttonHold(control.left))||(xDir==-1&&buttonHold(control.right))
		{
			if grappleMode==grappleState.down
			{
				ply.state=moveState.falling;
			}
			resetGrapple();
			ply.justLaunched=false;
		}
		resetHitPlace();
	}
	if state>1
	{
		grappleCollideEffect(true);
	}
	else ghostTrail(x,y,2,depth+1,sprite_index,image_index,{fade:0.1,alpha:0.6,xscaleSpd:0.1,yscaleSpd:0.1,alwaysMove: true});
}
else if state==2 //pull player
{
	grappleTime++;
	if instance_exists(followObj)&&followObj!=-1
	{
		x=followObj.x+followXOff;
		y=followObj.y+followYOff;
	}
	
	if grappleMode==grappleState.arc
	{
		if grappleTime>10
		{
			ply.vsp=-7.8;
			resetGrapple();
		}
	}
}
else if state<0 //reset
{
	xDir=0;
	yDir=0;
	if state==-1 //initial reset
	{
		if global.inputs[control.grapple]>0 global.inputs[control.grapple]=20; //so that it doesn't auto reset
	}
	
	var _dist=distance_to_object(ply);
	var _rSpd=5+1*(_dist>64)+1*(_dist>192);
	y-=(abs(grappleAngle-180)<45);
	while _rSpd>0&&ds_list_size(points)>0
	{
		var _o=points[|ds_list_size(points)-1];
		grappleAngle=point_direction(x,y,_o.x,_o.y);
		if point_distance(x,y,_o.x,_o.y)>1
		{
			_rSpd-=0.5;
			x+=lengthdir_x(0.5,grappleAngle);
			y+=lengthdir_y(0.5,grappleAngle);
		}
		if point_distance(x,y,_o.x,_o.y)<=1
		{
			instance_destroy(_o);
			ds_list_delete(points,ds_list_size(points)-1);
		}
	}
	y+=(abs(grappleAngle-180)<45);
	
	/*for (var i=0;i<2&&ds_list_size(points)>0;i++) //control speed
	{
		y-=(abs(grappleAngle-180)<45); //compensate for the angle skewing the y offset
		var _o=points[|ds_list_size(points)-1];
		grappleAngle=point_direction(x,y,_o.x,_o.y);
		x=_o.x;
		y=_o.y+(abs(grappleAngle-180)<45);
		instance_destroy(_o);
		ds_list_delete(points,ds_list_size(points)-1);
	}*/
	
	if place_meeting(x,y,ply)||ds_list_empty(points)
	{
		image_alpha=0;
		ds_list_clear(points);
		if instance_exists(oGrapplePoint) instance_destroy(oGrapplePoint);
		state=0;
		
		for (var i=0;i<ds_list_size(dragObj);i++)
		{
			if instance_exists(dragObj[|i])
			{
				dragObj[|i].x=ply.x;
				dragObj[|i].y=ply.y;
			}
		}
		ds_list_clear(dragObj);
		
		if place_meeting(x,y,oDroppedItem)
		{
			var _i=instance_place(x,y,oDroppedItem);
			_i.x=ply.x;
			_i.y=ply.y;
		}
	}
	else ghostTrail(x,y,4,depth+1,sprite_index,image_index,{fade:0.05,alpha:0.6,angle:grappleAngle,alwaysMove: true});
}

if state!=0
{
	for (var i=0;i<array_length(pullObjList);i++)
	{
		if place_meeting(x,y,pullObjList[i]) 
		{
			var _in=instance_place(x,y,pullObjList[i]);
			_in.grappleOffX=x-oGrapple.x;
			_in.grappleOffY=y-oGrapple.y;
			ds_list_add(pullObj,_in);
		}
	}
	for (var i=0;i<ds_list_size(pullObj);i++)
	{
		if !instance_exists(pullObj[|i])
		{
			ds_list_delete(pullObj,i);
			i--;
			continue;
		}
		with pullObj[|i]
		{
			x=oGrapple.x+grappleOffX;
			y=oGrapple.y+grappleOffY;
		}
	}
}

if abs(state)==1 
{
	for (var i=0;i<array_length(trackList);i++)
	{
		if place_meeting(x,y,trackList[i]) 
		{
			var _i=instance_place(x,y,trackList[i]);
			if !_i.followGrapple
			{
				_i.followGrapple=true;
				_i.xOff=_i.x-x;
				_i.yOff=_i.y-y;
				ds_list_add(dragObj,_i);
			}
		}
	}
	for (var i=0;i<ds_list_size(dragObj);i++) 
	{
		if instance_exists(dragObj[|i])
		{
			var _i=dragObj[|i];
			_i.x=x+_i.xOff;
			_i.y=y+_i.yOff;
		}
		else
		{
			ds_list_delete(dragObj,i);
			i--;
			continue;
		}
	}
}
}

drawLight=function(){
	if image_alpha!=0&&instance_exists(ply)
	{
		draw_circle(round(x)-camX(),round(y)-camY(),16,false);
		if instance_exists(oGrapplePoint) with oGrapplePoint draw_circle(round(x)-camX(),round(y)-camY(),8,false);
		else {
			for (var i=0;i<1;i+=0.05){
				draw_circle(round(lerp(ply.x,x,i))-camX(),round(lerp(ply.y,y,i))-camY(),8,false);
			}
		}
	}
}

event_user(0);