///@description Step function goes here
image_alpha=0;

state=0;
xDir=0;
yDir=0;
grappleMode=0; //0=normal, 1=swing, 2=arc, 3=down
upgrades=[];
collPointX=[];

grappleDist=80; //max distance
grappleTime=0; //time that the grapple has been moving/pulling
grappleReach=3; //final reach distance
grappleSpd=6; //initial movement speed
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
	return (distance_to_object(ply)>=grappleDist);
	//return (abs(ply.x-x)>=grappleDist||abs(ply.y-y)>=grappleDist);
}

points=ds_list_create();

//step event is run by the player as a function to control the exact timing
step=function(){ 
if state==0&&!global.transitioning&&!global.menuOpen //check for inputs
{
	xDir=0;
	yDir=0;
	x=ply.x-(ply.xscale==1);
	y=ply.y+grapplePlyYoff;
	if ply.state<=moveState.running||upgrades[4]||(buttonHold(control.down)&&buttonPressed(control.grapple)&&upgrades[grappleState.down])
	{
		if buttonPressed(control.swing)
		{
			if buttonHold(control.up)&&upgrades[grappleState.arc] //arc
			{
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
				if upgrades[grappleState.down]&&(ply.state>moveState.running||upgrades[4])
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
				if buttonHold(control.up) yDir=-1; //up
				else xDir=ply.xscale; //left/right
			}
		}
		
		if state==1
		{
			hitPlaceMoved=false;
			if place_meeting(x,y,oLadder) hitPlace=oLadder
			else if place_meeting(x,y,grappleHit) hitPlace=instance_place(x,y,grappleHit);
			else if place_meeting(x,y,npc)&&!place_meeting(x,y,enem) hitPlace=instance_place(x,y,npc);
			else hitPlace=-1;
		}
	}
}
else if state==1 //move in direction
{
	grappleTime++;
	image_alpha=1;
	if grappleMode==grappleState.arc //arc
	{
		ds_list_add(points,instance_create_depth(x,y,ply.depth+1,oGrapplePoint));
		y+=(grappleTime-23)*0.3;
		var _x=xDir/1.5*(grappleTime>9);
		moveHitPlace(x+_x,y);
		if _x==0||sign(yprevious-y)>-1&&!groundCollision(x,y)&&groundCollision(x+_x,y) x=x;
		else x+=_x
		var _hit=1;
		if place_meeting(x,y,oSpike) _hit=0;
		else if groundCollision(x,y)&&(groundCollision(x-1,y)&&groundCollision(x+1,y))
		{
			if (sign(yprevious-y)<1)&&(!groundCollision(x,yprevious)||groundCollision(xprevious,y)) _hit=2;
			else _hit=0
		}
		if place_meeting(x,y,npc)||place_meeting(x,y,oPlatform)||place_meeting(x,y,grappleHit)||_hit==2
		{
			grappleSetTracking(x,y);
			state=2;
			grappleTime=0;
		}
		else if grappleTime>90||_hit==0 resetGrapple();
		resetHitPlace();
	}
	else
	{
		x+=xDir*grappleSpd;
		y+=yDir*grappleSpd;
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
		}
		else if tooFar()||(yDir==-1&&buttonHold(control.down))//||(xDir==1&&buttonHold(control.left))||(xDir==-1&&buttonHold(control.right))
		{
			if grappleMode==grappleState.down
			{
				ply.state=moveState.falling;
			}
			resetGrapple();
		}
		resetHitPlace();
	}
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
			ply.vsp=-7;
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
	var _size=ds_list_size(points);
	if _size>0
	{
		var _o=points[|ds_list_size(points)-1];
		point_direction(x,y,_o.x,_o.y);
		x=_o.x;
		y=_o.y;
		instance_destroy(_o);
		ds_list_delete(points,ds_list_size(points)-1);
	}
	
	if place_meeting(x,y,ply)||ds_list_empty(points)
	{
		image_alpha=0;
		ds_list_clear(points);
		if instance_exists(oGrapplePoint) instance_destroy(oGrapplePoint);
		state=0;
	}
}
}

drawLight=function(){
	if image_alpha!=0 draw_circle(round(x)-camX(),round(y)-camY(),16,false);
}

event_user(0);