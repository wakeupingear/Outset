function Obj3D(defaultSprite,defaultIndex,updateFunc,alwaysUpdate,sliceNum,smallScale,color,angle,alpha,isShaded,drawDir,extraSprites) constructor{
	num=sliceNum;
	scale=smallScale;
	shade=isShaded;
	slices=array_create(num,[defaultSprite,defaultIndex,color,angle,alpha]); //create array of slices
	updateFunction=updateFunc;
	update=alwaysUpdate;
	for (var i=0;i<array_length(extraSprites);i++) //insert/push extra slices
	{
		var _s=extraSprites[i];
		if _s[1]<1 slices[round(num*_s[1])]=_s[0];
		else array_push(slices,_s[0]);
	}
	for (var i=0;i<num;i++) //set index for each sprite
	{
		var p=i/num;
		if shade slices[i][2]=merge_color(c_white,c_black,(1-p)*0.5);
		if updateFunction!=-1 slices[i][1]=updateFunction(i,num);
	}
	dir=drawDir; //1: far to near; -1: near to far
	render=function(x1,y1,x2,y2){
		for (var i=0;i>-1&&i<array_length(slices);i+=dir)
		{
			var p=i/num;
			var _s=lerp(scale,1,p);
			var _i=i;
			var _c=slices[i][2];
			if update slices[i]=updateFunction(_i,num);
			draw_sprite_ext(sReactorTunnel,slices[i][1],lerp(x1,x2,p),lerp(y1,y2,p),_s,_s,slices[i][3],_c,slices[i][4]);
		}
	}
}