/// @description Animation
//special overrides
if !instance_exists(oPlayerMove){
if state==moveState.standing&&!global.menuOpen&&image_blend==c_white
{
	if buttonHold(control.up)&&buttonHold(control.down)
	{
		if animation.currentAnimation!="disappointment"
		{
			image_index=setAnimation("disappointment",animation);
		}
	}
	else if buttonHold(control.up)
	{
		if animation.currentAnimation!="lookingUp"
		{
			image_index=setAnimation("lookingUp",animation);
		}
	}
	else if buttonHold(control.down)
	{
		if animation.currentAnimation!="lookingDown"
		{
			image_index=setAnimation("lookingDown",animation);
		}
	}
	else
	{
		if animation.currentAnimation!="standing"
		{
			image_index=setAnimation("standing",animation);
		}
	}
}
else if state==moveState.standing
{
	if animation.currentAnimation!="standingStill" image_index=setAnimation("standingStill",animation);
}
npcAnimation();
}

if goingFast
{
	ghostTrail(x,y,4,depth+1,sprite_index,image_index,{xscale:xscale,yscale:yscale,alwaysMove: true,fade: 0.07-(!global.alive)*0});
}

//strafe
if image_blend!=c_red{
strafe=max(0,strafe-0.4);
mask_index=sPlySpriteStrafe;
var _pE=place_meeting(x,y,enem);
var _prE=place_meeting(x,y,oProjectile);
if _pE||_prE
{
	if _pE 
	{
		var _e=instance_place(x,y,enem);
		if _e.attacking&&_e.damage!=0 strafe=4;
	}
	else if _prE 
	{
		var _e=instance_place(x,y,oProjectile);
		if _e.hurtsPlayer strafe=4;
	}
}
}
else strafe=0;
mask_index=sPlySprite;