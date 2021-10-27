transition=0; //0=black to black, 1=black to white
startRoom=room;
image_blend=c_black;

mode=0;
move=0;
ymove=0;
ladder=false;
xscale=1;

plyMove=0;
plySpd=0;
plyState=(instance_exists(ply)?ply.state:0);

regionColor=array_create(9);
regionColor[worldRegion.notdon]=merge_color(c_blue,c_black,0.85);
regionColor[worldRegion.west]=merge_color(c_green,c_black,0.75);
regionColor[worldRegion.air]=merge_color(c_green,c_black,0.85);
regionColor[worldRegion.deeptown]=merge_color(c_green,c_black,0.85);
regionColor[worldRegion.east]=merge_color(c_green,c_black,0.85);

whiteCol=merge_color(c_white,c_black,0.2);

draw=function(){
var _camX=0;//camX(); //drawing to surface not application_surface
var _camY=0;//camY();
switch (transition)
{
	case transitions.blackSudden:
	case transitions.blackToBlack:
		draw_set_alpha(image_alpha);
		draw_set_color(image_blend);
		draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
		draw_set_color(c_white);
		draw_set_alpha(1);
		break;
	case transitions.blackToWhite:
		if mode==0
		{
			draw_set_alpha(image_alpha);
			draw_set_color(c_black);
			draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
			draw_set_color(whiteCol);
			draw_set_alpha(image_alpha*image_alpha);
			draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
			draw_set_color(c_white);
			draw_set_alpha(1);
		}
		else
		{
			draw_set_alpha(image_alpha);
			draw_set_color(whiteCol);
			draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
			draw_set_alpha(1);
			draw_set_color(c_white);
		}
		break;
	case transitions.whiteSudden:
	case transitions.whiteToWhite:
		draw_set_alpha(image_alpha);
		draw_set_color(whiteCol);
		draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		break;
}
}