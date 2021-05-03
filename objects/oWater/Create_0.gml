if !instance_exists(oWaterController) instance_create_depth(0,0,layer_get_depth(layer_get_id("water"))+1,oWaterController);

inRange=false;
touch=false;

coll=[];
repeat 4 array_push(coll,instance_create_depth(x,y,depth,oWaterColl));

updateColl=function(){
	coll[0].x=x;
	coll[0].y=y;
	coll[0].image_xscale=image_xscale;
	
	coll[1].x=x;
	coll[1].y=y;
	coll[1].image_yscale=image_yscale;
	
	coll[2].x=x;
	coll[2].y=y+image_yscale-1;
	coll[2].image_xscale=image_xscale;
	
	coll[3].x=x+image_xscale-1;
	coll[3].y=y;
	coll[3].image_yscale=image_yscale;
}
updateColl();

touchingPly=function(){
	if !place_meeting(x,y,ply) return false;
	for (var i=0;i<4;i++) with coll[i] if place_meeting(x,y,ply) return false;
	return true;
}

alarm[0]=1; //Check if player spawns in water