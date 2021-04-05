/// @description Move
if global.alive{
x+=round(lengthdir_x(spd,image_angle));
y+=round(lengthdir_y(spd,image_angle));
if x>room_width||x<0||y>room_height||y<0 instance_destroy();
else if hitTerrain&&groundCollision(x,y) instance_destroy();
}