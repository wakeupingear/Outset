

function resetGrapple(){
	if instance_exists(oGrapple)
	{
		if oGrapple.state>0 
		{
			with oGrapple{
			grappleTime=0;
			xDir=0;
			yDir=0;
			if !place_meeting(x,y,ply)&&grappleMode!=grappleState.arc
			{
				var _d=ceil(distance_to_object(ply)/2)*2;
				for (var i=2;i<_d;i+=2) ds_list_add(points,instance_create_depth(lerp(ply.x+grapplePlyXoff,x,i/_d),lerp(ply.y+grapplePlyYoff,y,i/_d),ply.depth+1,oGrapplePoint));
			}
			else if grappleMode==grappleState.down ply.state=moveState.falling;
			grappleMode=0;
			state=-1;
			followObj=-1;
			
			for (var i=0;i<ds_list_size(dragObj);i++) if instance_exists(dragObj[|i]) 
			{
				var _i=dragObj[|i];
				_i.followGrapple=false;
				_i.x=x;
				_i.y=y;
			}
			ds_list_clear(dragObj);
			}
			ply.justLaunched=true;
		}
	}
}