/// @description Animation
if global.alive part_system_update(fireSystem);
if state==0&&flying&&isInRange(x,y){
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
particle(
x+lengthdir_x(-82*image_xscale,image_angle)+lengthdir_x(38*image_yscale,image_angle+270)+irandom_range(-2,2),
y+lengthdir_y(-82*image_xscale,image_angle)+lengthdir_y(38*image_yscale,image_angle+270)+irandom_range(-2,2),
depth+1,sDeathCircle,0,_struct);

particle(
x+lengthdir_x(-56*image_xscale,image_angle)+lengthdir_x(38*image_yscale,image_angle+270)+irandom_range(-2,2),
y+lengthdir_y(-56*image_xscale,image_angle)+lengthdir_y(38*image_yscale,image_angle+270)+irandom_range(-2,2),
depth+1,sDeathCircle,0,_struct);

particle(
x+lengthdir_x(82*image_xscale,image_angle)+lengthdir_x(38*image_yscale,image_angle+270)+irandom_range(-2,2),
y+lengthdir_y(82*image_xscale,image_angle)+lengthdir_y(38*image_yscale,image_angle+270)+irandom_range(-2,2),
depth+1,sDeathCircle,0,_struct);
}