image_speed=0;

touch=false;

xscale=1;

collPointX=[0];
collPointY=[0];
state=moveState.standing;
drawLight=function(){
	if distance_to_point(camX()+192,camY()+108)-23<200&&!groundCollision(x,y) draw_circle(round(x)-camX(),round(y)-camY(),23,false);
}