/// @description Animation
if global.alive part_system_update(fireSystem);
if state==0&&flying&&(!instance_exists(oCamera)||distance_to_object(oCamera)<384){
var _rand=irandom(12);
var _struct={
	blend: c_orange*(_rand<3)+c_red*(_rand==3),
	dir: image_angle+270+irandom_range(-3,3),
	spd: 1,
	alpha:1.3,
	fade:0.05,
	xscale:0.02,
	yscale:0.02,
	xscaleSpd:0.003,
	yscaleSpd:0.003,
}

exhaustPoints[0][0]=x+lengthdir_x(-82*image_xscale,image_angle)+lengthdir_x(38*image_yscale,image_angle+270);
exhaustPoints[0][1]=y+lengthdir_y(-82*image_xscale,image_angle)+lengthdir_y(38*image_yscale,image_angle+270);
particle(
exhaustPoints[0][0]+irandom_range(-2,2),
exhaustPoints[0][1]+irandom_range(-2,2),
depth+1,sDeathCircle,0,_struct);

exhaustPoints[1][0]=x+lengthdir_x(-56*image_xscale,image_angle)+lengthdir_x(38*image_yscale,image_angle+270);
exhaustPoints[1][1]=y+lengthdir_y(-56*image_xscale,image_angle)+lengthdir_y(38*image_yscale,image_angle+270);
particle(
exhaustPoints[1][0]+irandom_range(-2,2),
exhaustPoints[1][1]+irandom_range(-2,2),
depth+1,sDeathCircle,0,_struct);

exhaustPoints[2][0]=x+lengthdir_x(82*image_xscale,image_angle)+lengthdir_x(38*image_yscale,image_angle+270);
exhaustPoints[2][1]=y+lengthdir_y(82*image_xscale,image_angle)+lengthdir_y(38*image_yscale,image_angle+270)
particle(
exhaustPoints[2][0]+irandom_range(-2,2),
exhaustPoints[2][1]+irandom_range(-2,2),
depth+1,sDeathCircle,0,_struct);

if !distortAdded
{
	ds_list_add(global.distortObj,id);
	distortAdded=true;
}
}
else
{
	if distortAdded
	{
		ds_list_deleteValue(global.distortObj,id);
		distortAdded=false;
	}
}