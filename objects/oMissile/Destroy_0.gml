/// @description Explosion
explosionRange(1,x+collPointX[0],y+collPointY[0],x+collPointX[0],y+collPointY[0],0);
if !offscreen(x,y,0)&&oCamera.shakeX==0 shake(1,1,10);

//specific interactions
if place_meeting(x,y,oWastesCrate) with instance_place(x,y,oWastesCrate) damageCrate();