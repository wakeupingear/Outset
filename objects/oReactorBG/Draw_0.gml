/// @description Draw + tunnel

// Inherit the parent event
//draw_sprite(sprite_index,0,x,y);
if instance_exists(oSkyNotdon) image_alpha=round((1-oSkyNotdon.vShipTime)*4)/4;
//TODO: earthquake
oscillate(hoverOsci,"y",false,true);
draw_self();
draw_sprite_ext(sprite_index,1,x,y+sprite_height*1.5,1,2,0,-1,image_alpha);

if instance_exists(oReactorTunnel)
{
	if tunnel==-1 
	{
		tunnelFunc=function(_i,num,arr){ 
			arr[1]=1+((round(_i)%(num/(subNum)))<=num*subScale);
			return arr;
		}
		tunnel=new Obj3D(sReactorTunnel,1,tunnelFunc,false,num,xLerp/2.5,-1,0,1,true,1,[
			[[sReactorTunnelPylon,0,-1,0,1],0.2],
			[[sReactorTunnelPylon,0,-1,0,1],0.45],
			[[sReactorTunnelPylon,0,-1,0,1],0.7],
		])
	}
	
	var _x=x+4;
	var _y=y-70;
	draw_circle(_x,_y,16,false);
	
	if isInRange(x,y)||isInRange(oReactorTunnel.x,oReactorTunnel.y) tunnel.render(_x,_y,oReactorTunnel.x,oReactorTunnel.y);
	with oReactorTunnel draw_self();
}