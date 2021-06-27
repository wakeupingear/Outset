

function explosionRange(num,xMin,yMin,xMax,yMax,delay){
	for (var i=0;i<num;i++)
	{
		var _ex=instance_create_layer(irandom_range(xMin,xMax),irandom_range(yMin,yMax),"above",oExplosion);
		if i*delay>0
		{
			_ex.image_alpha=0;
			_ex.alarm[0]=i*delay;
		}
	}
}

function explosionCircle(num,_x,_y,radius,delay){
	for (var i=0;i<num;i++)
	{
		var _ang=irandom_range(0,359);
		var _len=irandom(radius);
		var _ex=instance_create_layer(_x+round(lengthdir_x(_len,_ang)),_y+round(lengthdir_y(_len,_ang)),"above",oExplosion);
		if i*delay>0
		{
			_ex.image_alpha=0;
			_ex.alarm[0]=i*delay;
		}
	}
}