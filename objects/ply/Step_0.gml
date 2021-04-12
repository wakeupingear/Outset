//process controller inputs
if global.transitioning move=move;
else if state==moveState.floating
{
	move=0;
	if (isDev||isTest)&&(!instance_exists(oGrapple)||oGrapple.state<2)
	{
		x=round(x+4*(-buttonHold(control.left)+buttonHold(control.right)));
		y=round(y+4*(-buttonHold(control.up)+buttonHold(control.down)));
	}
}
else if !global.menuOpen move=-buttonHold(control.left)+buttonHold(control.right);
else move=0;

if !global.transitioning&&!global.menuOpen&&(state<moveState.jumping||(state==moveState.falling&&coyote>0))&&buttonPressed(control.jump) jump=1;
else if !global.transitioning&&!global.menuOpen&&jump>0&&state<moveState.falling&&buttonHold(control.jump)&&jump<jumpHoldTime jump++;
else jump=0;

//grapple movement
with oGrapple if active step();

//movement
if state==moveState.ladder ladderPhysics();
else 
{
	if oGrapple.state<2||oGrapple.grappleMode==grappleState.arc physics();
	else grapplePhysics();
	if place_meeting(x,y,oLadder)&&buttonPressed(control.up)
	{
		resetGrapple();
		state=moveState.ladder;
		hsp=0;
		vsp=0;
		if groundCollision(x,y) while groundCollision(x,y) y--;
	}
}

//check collision
if object_index==ply
{
	if place_meeting(x,y,oSpike) 
	{
		var _s=instance_place(x,y,oSpike);
		hurtPlayer(_s.damage,"-",-3);
	}
	else if place_meeting(x,y,enem)
	{
		with instance_place(x,y,enem) 
		{
			hurtPlayer(damage,hsp,vsp);
			switch (object_index)
			{
				case oMissile:
					instance_destroy();
					break;
				default: break;
			}
		}
	}
}
//collect souldrop
while place_meeting(x,y,oSouldropCoin)
{
	instance_destroy(instance_place(x,y,oSouldropCoin));
}

//camera
if instance_exists(oPlayerCam)
{
	oPlayerCam.image_xscale=xscale;
	with oPlayerCam if instance_exists(ply) setPos(ply.x,ply.y);
}

//water
if global.inWater&&global.alive
{
	breath-=1/24 //ba da ba ba dum ba bum
	if breath<=-1 killPlayer();
}
else breath=global.maxBreath;

//test jump height - 44.69 (nice)
//if y<jumpStart&&(jumpStart-y)>jumpMax jumpMax=(jumpStart-y);
//show_debug_message(jumpMax)