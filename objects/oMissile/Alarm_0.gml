/// @description Angle
if xDir==1&&yDir==0 image_angle=0;
else if xDir==1&&yDir==-1 image_angle=45;
else if xDir==0&&yDir==-1 image_angle=90;
else if xDir==-1&&yDir==-1 image_angle=135;
else if xDir==-1&&yDir==0 image_angle=180;
else if xDir==-1&&yDir==1 image_angle=225;
else if xDir==0&&yDir==1 image_angle=270;
else if xDir==1&&yDir==-1 image_angle=315;

hsp=xDir*3;
vsp=yDir*5;

collPointX[0]=round(lengthdir_x(24,image_angle));
collPointY[0]=round(lengthdir_y(24,image_angle));

//if image_index==1 hitTerrain=false;