if ySpd>0 //done
{
	for (var i=0;i<floor(image_yscale/12);i++)
	{
		for (var k=0;k<image_xscale/12;k++) draw_sprite(sMykoBrick,ind,x+k*12,y+i*12);
	}
	if floor(image_yscale/12)!=0
	{
		for (var k=0;k<image_xscale/12;k++)
		{
			draw_sprite_part(sMykoBrick,ind,0,0,12,image_yscale mod 12,x+k*12,y+floor(image_yscale/12)*12);
		}
	}
}
else if ySpd<0 //done
{
	for (var i=0;i<floor(abs(image_yscale)/12);i++)
	{
		for (var k=0;k<abs(image_xscale)/12;k++) draw_sprite(sMykoBrick,ind,x+k*12,y-(i+1)*12);
	}
	if floor(image_yscale/12)!=0
	{
		for (var k=0;k<image_xscale/12;k++)
		{
			draw_sprite_part(sMykoBrick,ind,0,12-(abs(image_yscale) mod 12),12,abs(image_yscale) mod 12,x+k*12,y+image_yscale);
		}
	}
}
else if xSpd<0 //done
{
	for (var i=0;i<floor(abs(image_xscale)/12);i++)
	{
		for (var k=0;k<image_yscale/12;k++) draw_sprite(sMykoBrick,ind,x-(i+1)*12,y+k*12);
	}
	if floor(image_xscale/12)!=0
	{
		for (var k=0;k<image_yscale/12;k++)
		{
			draw_sprite_part(sMykoBrick,ind,12-(abs(image_xscale) mod 12),0,abs(image_xscale) mod 12,12,x+image_xscale,y+k*12);
		}
	}
}
else //done
{
	for (var i=0;i<floor(image_xscale/12);i++)
	{
		for (var k=0;k<image_yscale/12;k++) draw_sprite(sMykoBrick,ind,x+i*12,y+k*12);
	}
	if floor(image_xscale/12)!=0
	{
		for (var k=0;k<image_yscale/12;k++)
		{
			draw_sprite_part(sMykoBrick,ind,0,0,image_xscale mod 12,12,x+floor(image_xscale/12)*12,y+k*12);
		}
	}
}