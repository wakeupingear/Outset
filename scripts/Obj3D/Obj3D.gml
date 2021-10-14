 function Obj3D(defaultSprite,defaultIndex,updateFunc,alwaysUpdate,sliceNum,smallScale,color,angle,alpha,isShaded,drawDir,extraSprites) constructor{
	num=sliceNum;
	scale=smallScale;
	shade=isShaded;
	defaultColor=color;
	slices=array_create(num,[[defaultSprite,defaultIndex,color,angle,alpha]]); //create array of slices
	updateFunction=updateFunc;
	update=alwaysUpdate;
	for (var i=0;i<array_length(extraSprites);i++) //insert/push extra slices
	{
		var _s=extraSprites[i];
		if _s[1]<1 
		{
			slices[round(num*_s[1])]=array_combine(slices[round(num*_s[1])],[_s[0]]);
		}
		else array_push(slices,[_s[0]]);
	}
	for (var i=0;i<num;i++) //set index for each sprite
	{
		var p=i/num;
		for (var j=0;j<array_length(slices[i]);j++)
		{
			//if shade array_set( slices[i][j],2,merge_color(color,c_black,(1-p)*0.5)); //THIS LITERALLY DOESN"T WORK!!!!!!! GMS BUG!!!!
			if updateFunction!=-1 slices[i][j]=updateFunction(i,num,slices[i][j]);
		}
	}
	dir=drawDir; //1: far to near; -1: near to far
	render=function(x1,y1,x2,y2){
		for (var i=(dir==-1)*array_length(slices);i>-1&&i<array_length(slices);i+=dir)
		{
			var p=i/num;
			var _s=lerp(scale,1,p);
			var _i=i;
			for (var j=0;j<array_length(slices[i]);j++)
			{
				var _c=defaultColor; //slices[i][j][2];
				if shade _c=merge_color(_c,c_black,(1-p)*0.7);
				if update slices[i][j]=updateFunction(_i,num,slices[i][j]);
				draw_sprite_ext(slices[i][j][0],slices[i][j][1],lerp(x1,x2,p),lerp(y1,y2,p),_s,_s,slices[i][j][3],_c,slices[i][j][4]);
			}
		}
	}
}