function physics(){
	//horizontal velocity
	if move!=0&&xscaleFlip xscale=move;
	if move!=0&&((move==-1&&hsp>-hspMax)||(move==1&&hsp<hspMax))&&!groundCollision(x+move,y-maxYChange)&&canMove
	{
		if state==moveState.standing&&groundCollision(x,y+1) state=moveState.running;
		if (veltime>=accTime)
		{
			if hsp!=0&&sign(hsp)!=move hsp+=1*move*hspAcc;
			hsp+=move*hspAcc;
			veltime=0;
		}
		else veltime++;
	}
	else if move==0&&hsp!=0
	{
		if (veltime>=decTime)
		{
			if abs(hsp)==hspAcc
			{
				if !groundCollision(ceil(x),y) x=ceil(x);
				else x=floor(x);
				hsp=0;
			}
			else hsp-=hspAcc*sign(hsp);
			veltime=0;
		}
		else veltime++;
	}
	//jump
	if state==moveState.floating vsp=0;
	else if jump>0&&canMove
	{
		coyote=0;
		vsp=-(jumpSpd+jumpAdd-(power(jump,1.75)/jumpHoldTime)*global.grav);
		y+=vsp
		state=moveState.jumping;
		if groundCollision(x,y)
		{
			while groundCollision(x,y) y++
			vsp=0
			state=moveState.falling;
		}
	}
	
	//gravity
	vsp+=global.grav*gravMultiplier;
	vsp=clamp(vsp,-vspMax,vspMax);
	//if vsp<vspMax&&state>moveState.running vsp+=global.grav;
	
	//horizontal movement
	//x+=(hsp mod 1)*sign(hsp);
	repeat abs(round(hsp))
	{
		x+=sign(hsp);
		if object_index==ply&&goingFast destroyBreakables();
		if groundCollision(x,y) //horizontally moving into collision
		{
			if !groundCollision(x,y-maxYChange)&&groundCollision(x-sign(hsp),y+1) //moving up slope
			{
				y=round(y-maxYChange);
				while !groundCollision(x,y+1) y++;
				state=moveState.running;
			}
			else if !groundCollision(x,y+maxYChange)&&groundCollision(x-sign(hsp),y-1) //moving down slope
			{
				y=round(y+maxYChange);
				while !groundCollision(x,y-1) y--;
				state=moveState.falling;
			}
			else 
			{
				//if state=moveState.standing
				x=round(x-1);
				while groundCollision(x,y) x-=sign(hsp);
				hsp=0;
				break;
			}
		}
	}
	
	//moving down a slope
	if state!=moveState.floating&&state<moveState.jumping&&!groundCollision(x,y+1)
	{
		if groundCollision(x,y+1+abs(hsp)) vsp=ceil(abs(vsp))+1;
		else state=moveState.falling;
	}
	
	//vertical movement
	//y+=(vsp mod 1)*sign(vsp);
	repeat abs(round(vsp))
	{
		y+=sign(vsp);
		if object_index==ply&&goingFast&&abs(vsp)>=1 destroyBreakables();
		if groundCollision(x,y)&&state!=moveState.floating
		{
			if vsp<0&&(!groundCollision(x+xscale*maxXChange,y)||!groundCollision(x-xscale*maxXChange,y)) //corner correction
			{
				if !groundCollision(x+xscale*maxXChange,y) while groundCollision(x,y) x+=xscale;
				else while groundCollision(x,y) x-=xscale;
				continue;
			}
			while groundCollision(x,y) y-=sign(vsp);
			if groundCollision(x,y+1) //land
			{
				jumpAdd=0;
				y=floor(y);
				if object_index==ply //reset inputs
				{
					if global.inputs[control.jump]>0&&global.inputs[control.jump]<12 global.inputs[control.jump]=0;
					if global.inputs[control.grapple]>0&&global.inputs[control.grapple]<12 global.inputs[control.grapple]=0;
				}
				state=moveState.standing+(move!=0);
			}
			if false&&vsp<0 vsp--; //I don't know what this was supposed to do but it was causing a crash so I set it to always false
			else 
			{
				vsp=0;
				break;
			}
		}
		else if state==moveState.jumping&&vsp>0 state=moveState.falling;
	}
	//if groundCollision(x,y-1) show_message(vsp)
	
	//reset coyote time
	if state<moveState.jumping coyote=coyoteMax;
	else if coyote>0 coyote--;
	
	//reset jump add
	if state!=moveState.jumping jumpAdd=0;
	
	//reset running against a wall
	if state==moveState.running&&hsp==0 state=moveState.standing;
	
	//check special collisions
	if groundCollision(x,y,oGravityField)
	{
		var _f=instance_place(x,y,oGravityField);
		if _f.pause==-1
		{
			impulse(_f.xDir,_f.yDir,id);
		}
	}
}

function setStateAnimation(forceChange){
	if lastState!=state||forceChange
	{
		lastState=state;
		if array_length(stateToAnim)>state setAnimation(stateToAnim[state],animation);
	}
}

function push(xDir,yDir){
	while groundCollision(x,y)
	{
		x+=xDir;
		y+=yDir;
	}
	hsp=sign(x-xprevious)*ceil((abs(x-xprevious)/10)/hspAcc)*hspAcc; //we can use xprevious since push() is used in begin events
	//vsp=sign(y-yprevious)*ceil((abs(y-yprevious)/10)/global.grav)*global.grav;
	xprevious=x;
	yprevious=y;
}

function groundCollision(_x,_y,_coll){
	if is_undefined(_coll) _coll=collType;
	if state==moveState.floating return false;
	for (var i=0;i<array_length(collPointX);i++) if collision_point(_x+collPointX[i],_y+collPointY[i],_coll,true,true) return true;
	return false;
}

function grapplePhysics(){
	if oGrapple.xDir!=0 xscale=oGrapple.xDir;
	if oGrapple.grappleMode==grappleState.pull
	{
		if oGrapple.xDir!=0 //left/right
		{
			hsp=oGrapple.xDir*max(abs(hsp),2);
			repeat abs(hsp)
			{
				x+=sign(hsp);
				destroyBreakables();
				if groundCollision(x,y)
				{
					if !groundCollision(x,y-maxYChange-1)
					{
						y-=maxYChange+1;
						while !groundCollision(x,y+1) y++;
					}
					else if !groundCollision(x,y+maxYChange+1)
					{
						y+=maxYChange-1;
						while !groundCollision(x,y-1) y--;
					}
					else
					{
						x-=sign(hsp);
						//xscale=-oGrapple.xDir;
						if state!=moveState.hanging
						{
							shake(1,1,10);
						}
						state=moveState.hanging;
						hsp=0;
						break;
					}
				}
			}
		}
		else //up
		{
			vsp=oGrapple.yDir*max(abs(vsp),4.6);
			repeat abs(vsp)
			{
				y+=sign(vsp);
				destroyBreakables();
				if groundCollision(x,y)
				{
					if !groundCollision(x-maxYChange-1,y)
					{
						x+=-maxYChange-1;
						while !groundCollision(x+1,y) x++;
					}
					else if !groundCollision(x+maxYChange+1,y)
					{
						x+=maxYChange+1;
						while !groundCollision(x-1,y) x--;
					}
					else
					{
						y-=sign(vsp);
						if state!=moveState.hanging
						{
							shake(1,1,10);
						}
						state=moveState.hanging;
						vsp=0;
						break;
					}
				}
			}
		}
	}
	else if oGrapple.grappleMode==grappleState.swing
	{
		
	}
	else if oGrapple.grappleMode==grappleState.down
	{
		vsp=5;
		hsp=0;
		repeat vsp
		{
			y+=sign(vsp);
			destroyBreakables();
			
			if groundCollision(x,y)
			{
				while groundCollision(x,y+1) y--;
				resetGrapple();
				state=moveState.standing;
				shake(1,1,10);
				break;
			}
		}
		
		if y>oGrapple.y
		{
			oGrapple.y=y-1;
			oGrapple.image_alpha=0;
		}
	}
	
	if (oGrapple.xDir==-1&&x<oGrapple.x)||(oGrapple.xDir==1&&x>oGrapple.x)||(oGrapple.yDir==-1&&y<oGrapple.y)
	{
		state=moveState.falling;
		if point_distance(x,y,oGrapple.x,oGrapple.y)<=20
		{
			oGrapple.x=x;
			oGrapple.y=y;
		}
		resetGrapple();
	}
	else if buttonPressed(control.down)&&oGrapple.grappleMode!=grappleState.down
	{
		state=moveState.falling;
		vsp=0;
		resetGrapple();
	}
	else if buttonPressed(control.jump)&&groundCollision(x,y+2)
	{
		state=moveState.jumping;
		jump=1;
		jumpAdd+=global.grav*2;
		resetGrapple();
	}
	else if state==moveState.pulling
	{
		if oGrapple.grappleMode==grappleState.pull
		{
			if oGrapple.yDir==0&&((buttonPressed(control.right)&&oGrapple.xDir==-1)||(buttonPressed(control.left)&&oGrapple.xDir==1))
			{
				hsp=-(oGrapple.xDir)*(1+(oGrapple.grappleTime<10))*abs(hsp)/3;
				resetGrapple();
				state=moveState.falling;
				if groundCollision(x,y+1) state=moveState.running;
			}
		}
	}
	else if state==moveState.hanging
	{
		if oGrapple.grappleMode==grappleState.pull&&buttonPressed(control.jump)
		{
			resetGrapple();
			state=moveState.jumping;
			jump=1;
			jumpAdd+=global.grav*2;
			hsp=(buttonHold(control.right)-buttonHold(control.left))*hspMax*1.5;
		}
	}
	
	if state<moveState.pulling
	{
		if hsp!=0 hsp=round(hsp/hspAcc)*hspAcc;
		if vsp!=0 vsp=round(vsp/global.grav)*global.grav;
		//hsp=round(hsp);
		//vsp=round(vsp);
	}
}

function simplePhysics(){
	if hsp!=0
	{
		xscale=sign(hsp);
		if (veltime>=decTime)
		{
			if abs(hsp)==hspAcc
			{
				if !groundCollision(ceil(x),y) x=ceil(x);
				else x=floor(x);
				hsp=0;
			}
			else hsp-=hspAcc*sign(hsp);
			veltime=0;
		}
		else veltime++;
	}
	if state==moveState.standing&&!groundCollision(x,y+1) state=moveState.falling;
	if vsp<vspMax&&state==moveState.falling vsp+=global.grav;
	
	//horizontal movement
	repeat abs(round(hsp)) //move every 0.2
	{
		x+=sign(hsp);
		if groundCollision(x,y)
		{
			if !groundCollision(x,y-maxYChange)&&groundCollision(x-sign(hsp),y+1)
			{
				y-=maxYChange;
				while !groundCollision(x,y+1) y++
				state=moveState.running
			}
			else 
			{
				if state=moveState.standing
				x-=sign(hsp);
				x=round(x)
				while groundCollision(x,y) x-=sign(hsp);
				hsp=0;
				break;
			}
		}
	}
	
	//vertical movement
	repeat abs(round(vsp))
	{
		y+=sign(vsp);
		if groundCollision(x,y)
		{
			while groundCollision(x,y) y-=sign(vsp);
			vsp=0;
			if groundCollision(x,y+1) //land
			{
				state=moveState.standing;
			}
			break;
		}
	}
}
	
function ladderPhysics(){
	if move!=0
	{
		state=moveState.ladderMove;
		xscale=move;
		x=round(x)+move;
		if groundCollision(x,y)
		{
			if !groundCollision(x,y-maxYChange)&&groundCollision(x-sign(hsp),y+1)
			{
				y-=maxYChange;
				while !groundCollision(x,y+1) y+=0.25;
			}
			else 
			{
				state=moveState.ladder;
				x-=move;
			}
		}
	}
	var _ymove=(buttonHold(control.down)-buttonHold(control.up))*(!global.menuOpen);
	if _ymove!=0
	{
		state=moveState.ladderMove;
		y=round(y+_ymove*2);
		if groundCollision(x,y) 
		{
			if _ymove==0 _ymove=1;
			while groundCollision(x,y) y-=_ymove;
			state=moveState.ladder;
		}
	}
	
	if _ymove==0&&move==0 state=moveState.ladder;
	
	if !place_meeting(x,y,oLadder)
	{
		state=moveState.falling;
		if _ymove==-1 
		{
			vsp=-3.6;
		}
		else if groundCollision(x,y+1) state=moveState.standing;
	}
	
	if jump==1||buttonPressed(control.jump)
	{
		if _ymove==-1 jumpAdd=1;
		physics();
	}
}