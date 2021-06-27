//process controller inputs
if global.transitioning move=move;
else if state==moveState.floating
{
	move=0;
	if (isDev||isTest)&&(!instance_exists(oGrapple)||oGrapple.state<2)//&&false
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
							scr_toggleLava();
							break;
						case "iFormula":
							killPlayer();
							break;
						default: break;
					}
					break;
			}
			buttonFreeze(control.item);
		}
		else if buttonReleased(control.item)
		{
			switch (global.inventory[|global.itemSlot])
			{
				default:
					switch (string_letters(global.inventory[|global.itemSlot]))
					{
						case "iWrench":
							var _ang=(buttonHold(control.down))? 270 : 90-xscale*90*(!buttonHold(control.up));
							var _p=projectile(x,y,depth+1,{sprite: sItems,type:1,spd:4,dir: _ang,destroyInd: 1,data: {item: global.inventory[|global.itemSlot]},destroyOnCleanup: true});
							_p.type=1;
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
if state==moveState.ladder||state==moveState.ladderMove ladderPhysics();
else 
{
	if !instance_exists(oGrapple)||(oGrapple.state<2||oGrapple.grappleMode==grappleState.arc) physics();
	else grapplePhysics();
	if (buttonPressed(control.up)||buttonPressed(control.down))&&place_meeting(x,y,oLadder)
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
		var _e=instance_place(x,y,enem);
		if (instance_exists(oGrapple)&&oGrapple.state>1)||abs(hsp)>2
		{
			if global.alive
			{
				shake(1,1,10);
				_e.hsp+=hsp;
				_e.vsp+=vsp;
				hurtEnem(_e,1);
			}
			if !object_is_ancestor(_e.object_index,enemWall)
			{
				hsp=-hsp;
				vsp=-vsp;
			}
			resetGrapple();
		}
		else
		{
			if _e.image_blend!=c_red&&_e.damage>0 with _e
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