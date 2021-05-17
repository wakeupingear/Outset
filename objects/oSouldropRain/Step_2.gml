xOff+=spd.x;
yOff+=spd.y;
event_user(0);
if x>camX()+384*2||x<camX()-384||y<camY()-100||y>camY()+216*2 instance_destroy();