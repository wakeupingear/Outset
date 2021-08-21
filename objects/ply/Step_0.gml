//process controller inputs
if global.transitioning move=move;
else if state==moveState.floating
{
	move=0;
	if (isDev||isTest)&&(!instance_exists(oGrapple)||oGrapple.state<1)//&&false
	{
		x=round(x+4*(-buttonHold(control.left)+buttonHold(control.right)));
		y=round(y+4*(-buttonHold(control.up)+buttonHold(control.down)));
	}
}
else if !global.menuOpen move=-buttonHold(control.left)+buttonHold(control.right);
else move=0;

//xscale
if !global.transitioning&&!global.menuOpen
{
	if buttonHold(control.right) xscale=1;
	else if buttonHold(control.left) xscale=-1;
}

if !global.transitioning&&!global.menuOpen&&(state<moveState.jumping||(state==moveState.falling&&coyote>0))&&buttonPressed(control.jump) jump=1;
else if !global.transitioning&&!global.menuOpen&&jump>0&&state<moveState.falling&&buttonHold(control.jump)&&jump<jumpHoldTime jump++;
else jump=0;

//item usage
if buttonPressed(control.item)&&state>moveState.running global.inputs[control.item]=0; //-1
else if visible&&!global.menuOpen&&!global.transitioning&&global.alive&&ds_list_size(global.inventory)>0
{
	if buttonPressed(control.swapLeft)
	{
		if global.itemSlot==0 global.itemSlot=ds_list_size(global.inventory)-2;
		else global.itemSlot-=2;
		setItemFill();
	}
	if buttonPressed(control.swapRight)
	{
		if global.itemSlot==ds_list_size(global.inventory)-2 global.itemSlot=0;
		else global.itemSlot+=2;
		setItemFill();
	}
	if global.inputs[control.item]>=itemFillMax
	{
		if buttonHold(control.item) //Hold to charge
		{
			switch (global.inventory[|global.itemSlot])
			{
				default:
					switch (string_letters(global.inventory[|global.itemSlot]))
					{
						case "iSolitaire":
						case "iRocketBook":
						case "iPhoneNote":
							if state>moveState.running 
							{
								global.inputs[control.item]=0;
								break;
							}
							conversation(global.itemText[$ global.inventory[|global.itemSlot]][4]);
							break;
						case "iLadder":
							var _l=instance_create_layer(x+xscale*12,y,"people",oItemLadder);
							_l.image_xscale=xscale;
							with _l eventAddObject(object_index,room,x,y,"people",[image_xscale]);
							removeItem(global.inventory[|global.itemSlot]);
							break;
						case "iLavaSwitch":
							scrToggleLava();
							break;
						case "iFormula":
							killPlayer();
							break;
						default: break;
					}
					break;
			}
			if itemFillMax>-1 buttonFreeze(control.item);
		}
		else if buttonReleased(control.item)
		{
			switch (global.inventory[|global.itemSlot])
			{
				default:
					switch (string_letters(global.inventory[|global.itemSlot]))
					{
						case "iWrench":
							shake(1,1,10);
							var _ang=(buttonHold(control.down))? 270 : 90-xscale*90*(!buttonHold(control.up));
							projectile(x,y,depth+1,{
								sprite: sItems,type:1,index:3,spd:4,dir: _ang,speed:0,angSpd:-10*xscale,
								destroyInd: 1,data: {item: global.inventory[|global.itemSlot]},destroyOnCleanup: true
							});
							removeItem(global.inventory[|global.itemSlot]);
							break;
						default: break;
					}
					break;
			}
		}
	}
}

//grapple movement
with oGrapple if active step();

//movement
var _startHsp=hsp;
var _startVsp=vsp;
if state==moveState.ladder||state==moveState.ladderMove ladderPhysics();
else 
{
	if !instance_exists(oGrapple)||(oGrapple.state<2||oGrapple.grappleMode==grappleState.arc) physics();
	else grapplePhysics();
	if !global.menuOpen&&!global.transitioning&&(buttonPressed(control.up)||buttonPressed(control.down)||buttonPressed(control.confirm))&&place_meeting(x,y,oLadder)
	{
		shake(1,1,10);
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
		var _e=instance_place(x,y,enem);
		if !_e.enemActive switch (_e.object_index)
		{
			default: break;
		}
		else if (instance_exists(oGrapple)&&oGrapple.state>1)||(goingFast&&alarm[0]<5)
		{
			if global.alive
			{
				shake(1,1,10);
				switch (_e.object_index)
				{
					case oExplosiveBarrel:
						//_e.hsp=sign(hsp)*min(_e.hspMax,hsp);
						_e.move=sign(hsp);
						_e.hsp=_e.move*_e.hspMax;
						_e.moving=true;
						_e.vsp+=vsp;
						break;
					default:
						_e.hsp+=hsp;
						_e.vsp+=vsp;
						hurtEnem(_e,1);
						break;
				}
			}
			if !object_is_ancestor(_e.object_index,enemWall)
			{
				hsp=-hsp;
				vsp=-vsp;
			}
			resetGrapple();
		}
		else if _e.attacking
		{
			if _e.image_blend!=c_red&&_e.damage>0 with _e
			{
				switch (object_index)
				{
					default:
						hurtPlayer(damage,hsp,vsp);
						break;
				}
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
	else if place_meeting(x,y,npc)
	{
		var _n=instance_place(x,y,npc);
		if _n.takeDamage&&((instance_exists(oGrapple)&&oGrapple.state>1)||(goingFast&&alarm[0]<5))&&_n.image_blend!=c_red
		{
			hsp=-hsp;
			vsp=-vsp;
			shake(1,1,10);
			resetGrapple();
			with _n
			{
				image_blend=c_red;
				alarm[0]=30;
				if damageCutscene!="" conversation(damageCutscene);
			}
		}
	}
	
	if place_meeting(x,y,oSwitch)
	{
		var _s=instance_place(x,y,oSwitch);
		if state<=moveState.running
		{
			global.interactText=5;
			if (buttonPressed(control.up)||buttonPressed(control.confirm))
			{
				with _s event_user(0);
			}
		}
		if !_s.touch&&goingFast 
		{
			with _s event_user(0);
			hsp=-hsp;
			vsp=-vsp;
			resetGrapple();
		}
	}
}

if collision_point(x,y,oLava,true,true)
{
	var _l=instance_place(x,y,oLava);
	if global.alive
	{
		if image_blend==c_white hurtPlayer(1,0,0);
		impulse(_l.hsp,_l.vsp,id);
	}
	else impulse(_l.deathHsp,_l.deathVsp,id);
}

//lock to pathfinding
if instance_exists(oPlayerMove)
{
	x=oPlayerMove.x;
	y=oPlayerMove.y;
	xscale=oPlayerMove.xscale;
	yscale=oPlayerMove.yscale;
	hsp=oPlayerMove.hsp;
	vsp=oPlayerMove.vsp;
	image_index=oPlayerMove.image_index;
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
if global.inWater&&global.alive//&&!global.notPause
{
	breath-=1/24 //ba da ba ba dum ba bum
	if breath<=-1 killPlayer();
}
else breath=global.maxBreath;
//test jump height - 44.69 (nice)
//if y<jumpStart&&(jumpStart-y)>jumpMax jumpMax=(jumpStart-y);
//show_debug_message(jumpMax)

//going fast
if abs(hsp)>=hspMax*1.5 goingFast=true;
else if instance_exists(oGrapple)&&(oGrapple.state>1) goingFast=true;
else if justLaunched
{
	goingFast=true;
	if abs(hsp)<=hspMax*1.5&&abs(vsp)<1 justLaunched=false;
}
else goingFast=false;
if goingFast
{
	fastIntensity=1;
}
else
{
	fastIntensity=0;
}

if hsp==0&&abs(_startHsp)>hspMax*1.5&&state==moveState.ladder shake(1,1,10);