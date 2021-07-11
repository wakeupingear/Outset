/// @description Draw + tunnel

// Inherit the parent event
event_inherited();

if instance_exists(oReactorTunnel)
{
	if tunnel==-1 
	{
		tunnelFunc=function(_i,num){ return 1+((round(_i)%(num/(subNum)))<=num*subScale);}
		tunnel=new Obj3D(sprite_index,1,tunnelFunc,false,num,xLerp/2.5,-1,0,1,true,1,[
			[[sReactorTunnelPylon,0,-1,0,1],0.2],
			[[sReactorTunnelPylon,0,-1,0,1],0.45],
			[[sReactorTunnelPylon,0,-1,0,1],0.7],
		])
	}
	
	var _x=x+4;
	var _y=y-70;
	draw_circle(_x,_y,16,false);
	
	if isInRange(x,y) tunnel.render(_x,_y,oReactorTunnel.x,oReactorTunnel.y);
	with oReactorTunnel draw_self();
}