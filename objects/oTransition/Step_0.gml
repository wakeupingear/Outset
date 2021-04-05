/// @description Transition
switch (transition)
{
	case transitions.blackToBlack:
	case transitions.blackToWhite:
	case transitions.whiteToWhite:
	case transitions.blackSudden:
	case transitions.whiteSudden:
		if mode==0
		{
			image_alpha+=0.075;
			if image_alpha>1.4
			{
				mode=1;
				if global.nextRoom!=startRoom room_goto(global.nextRoom);
				else room_restart();
				image_alpha=1.05;
				if transition==transitions.blackSudden||transition==transitions.whiteSudden
				{
					image_alpha+=2;
					alarm[1]=5; //give a small window to set stuff up behind the transition
				}
			}
		}
		else
		{
			image_alpha-=0.075;
			if image_alpha<=0 instance_destroy();
		}
		break;
}