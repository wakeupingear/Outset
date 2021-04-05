var _camX=camX();
var _camY=camY();
switch (transition)
{
	case transitions.blackSudden:
	case transitions.blackToBlack:
		draw_set_alpha(image_alpha);
		draw_set_color(c_black);
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
			draw_set_color(c_nearWhite);
			draw_set_alpha(image_alpha*image_alpha);
			draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
			draw_set_color(c_white);
			draw_set_alpha(1);
		}
		else
		{
			draw_set_alpha(image_alpha);
			draw_set_color(c_nearWhite);
			draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
			draw_set_alpha(1);
			draw_set_color(c_white);
		}
		break;
	case transitions.whiteSudden:
	case transitions.whiteToWhite:
		draw_set_alpha(image_alpha);
		draw_set_color(c_nearWhite);
		draw_rectangle(_camX,_camY,_camX+384,_camY+216,false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		break;
}