function hurtEnem(_id,_damage){
	with _id
	{
		myHealth-=_damage;
		currentAnimation="attacked";
		animating=true;
		image_blend=c_red;
		alarm[0]=30;
		
		var _isWall=object_is_ancestor(object_index,enemWall);
		if myHealth<=0
		{
			switch object_index
			{
				default:
					if !_isWall
					{
						particle(x,y,depth,sprite_index,image_index,{
							fade:0.1
						});
						explosionCircle(floor(abs(sprite_width/7)),x,y,sprite_height/2,3);
					}
					instance_destroy();
					break;
			}
		}
	}
}