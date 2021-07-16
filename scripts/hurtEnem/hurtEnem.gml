function hurtEnem(_id,_damage){
	with _id
	{
		myHealth-=_damage;
		setAnimation("attacked",animation);
		image_blend=c_red;
		alarm[0]=30;
		
		var _isWall=object_is_ancestor(object_index,enemWall);
		if myHealth<=0
		{
			switch object_index
			{
				case oExplosiveBarrel:
					move=ply.xscale;
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
		}
	}
}