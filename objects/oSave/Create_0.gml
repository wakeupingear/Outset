image_speed=0;

touch=false;

xscale=1;

collPointX=[0];
collPointY=[0];
collType=hitobj;
state=moveState.standing;
drawCycle=0;
drawLight=function(){
	if distance_to_point(camX()+192,camY()+108)-23<200&&!groundCollision(x,y) {
		var _cycle=(instance_exists(ply))?ply.drawCycle:0;
		draw_circle(round(x-1)-camX(),round(y-1)-camY(),35+sin(_cycle*2*pi),false);
	}
}