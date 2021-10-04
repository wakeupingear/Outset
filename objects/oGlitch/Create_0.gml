list=ds_list_create();

alwaysMove=false;
followCam=false;
addGlitch=function(xPos,yPos,xscale,yscale,blend,alpha,rate){
	ds_list_add(list,{
		x: xPos,
		y: yPos,
		xs: xscale,
		ys: yscale,
		blend: blend,
		alpha: alpha,
		rate: rate,
		count: 0,
		active: true
	});
}
colors=[c_red,c_green,c_blue];

switch room
{
	case rVRUnfinished:
		followCam=true;
		for (var i=0;i<45;i++)
		{
			addGlitch(irandom_range(-16,368),irandom_range(-16,200),8*(1+irandom(5)),8*(1+irandom(5)),colors[irandom(array_length(colors)-1)],0.25*(1+irandom(2)),irandom_range(2,16));
		}
		break;
	default:
		break;
}