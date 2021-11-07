function hurtEnem(_id,_damage){
	var _damaged=false;
	with _id if alarm[0]==-1
	{
		myHealth-=_damage;
		setAnimation("attacked",animation);
		_damaged=true;
		alarm[0]=30;
		
		var _isWall=object_index==enemWall||object_is_ancestor(object_index,enemWall);
		if myHealth<=0
		{
			if isObj(id,boss)
			{
				attacking=false;
				enemActive=false;
				alarm[2]=dieDelay;
			}
			else switch object_index
			{
				case oConveyorSwitch:
					_damaged=false;
					if !roomHasPower() break;
					shake(1,1,10);
					switchConveyors();
					break;
				case oRedCarpet:
					_damaged=false;
				case oExplosiveBarrel:
					move=ply.xscale;
					break;
				default:
					switch sprite_index
					{
						case sWastesBombRack:
							var _p=particle(x,y,depth,sprite_index,2,{
								speed:1
							});
							_p.alarm[0]=10;
							instance_destroy();
							break;
						default:
							if !_isWall
							{
								particle(x,y,depth,sprite_index,image_index,{
									fade:0.1
								});
								if image_xscale==1 var _x1=x-sprite_get_xoffset(sprite_index);
								else var _x1=x+sprite_get_xoffset(sprite_index);
								var _x2=_x1+sprite_width;
								if image_yscale==1 var _y1=y-sprite_get_yoffset(sprite_index);
								else var _y1=x+sprite_get_yoffset(sprite_index);
								var _y2=_y1+sprite_height;
								explosionRange(floor(abs(sprite_width/7)),_x1,_y1,_x2,_y2,1);
							}
							instance_destroy();
							break;
					}
					break;
			}
			
			if _damaged image_blend=c_red;
		}
		else if enemHitTrigger!=-1 enemHitTrigger();
	}
	return _damaged;
}