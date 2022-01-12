/// @description Angle
if direction==0{
	if xDir==1&&yDir==0 direction=0;
	else if xDir==1&&yDir==-1 direction=45;
	else if xDir==0&&yDir==-1 direction=90;
	else if xDir==-1&&yDir==-1 direction=135;
	else if xDir==-1&&yDir==0 direction=180;
	else if xDir==-1&&yDir==1 direction=225;
	else if xDir==0&&yDir==1 direction=270;
	else if xDir==1&&yDir==-1 direction=315;
}

collPointX[0]=round(lengthdir_x(24,direction));
collPointY[0]=round(lengthdir_y(24,direction));

//if image_index==1 hitTerrain=false;