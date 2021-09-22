destroyOnCleanup=false;
switch (destroyInd)
{
	case 1: //drop item
		shake(1,1,10);
		var _i=addDroppedItem(x,y,room,data.item);
		_i.image_angle=image_angle;
		break;
	case 2: //explode
		explosionRange(1,x,y,x,y,0);
		break;
	default: break;
}

//specific interactions
destroyBreakables(oBreakable,oWastesCrate);