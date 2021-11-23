staticCoin=true;
cID=id;
alarm[0]=1;
value=1;
image_index=(ceil(x/8)*8) mod 4

yVars=new oscillateVars(1.5,3);
yVars.pos=random(x mod (24*pi));

followGrapple=false;

if !global.alive instance_deactivate_object(id);

drawLight=function(){
	draw_circle(x-camX()-1,y-camY()-1,15+(ystart-y)/3,false);
}

distortDraw=function(){
	draw_sprite_ext(sNormalCircleSmall,0,x-camX(),y-camY(),0.5,0.5,-(global.roomTime%100)/100*360,-1,0.5);
}

collectParticle=function(spr){
	var _num=8;
	for (var i=0;i<_num;i++)
	{
		particle(x,y,depth,spr,0,{
			dir: i*360/_num,
			spd: 1,
			xscale: 5,
			yscale: 5,
			alpha: 3,
			fade: 0.15,
			alwaysMove: true
		});
	}
}