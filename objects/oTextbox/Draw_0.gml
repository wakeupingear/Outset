x=camX()+(1-image_alpha)*64*(!global.hudSide-global.hudSide);
y=camY()+132*(!top);

leftShift=0;
rightShift=0;

if sprite_index==sTextbox
{
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,global.hudColorList[global.hudColor],image_alpha*0.8);
	draw_sprite_ext(sprite_index,1,x,y,1,1,0,-1,image_alpha);
}
for (var i=0;i<array_length(portLeft);i++)
{
	draw_sprite_ext(portLeft[i],portInd,x+16+textX+leftShift*i,y+textY+16,1,1,0,-1,image_alpha)
	leftShift+=(32+padding);
}
for (var i=0;i<array_length(portRight);i++)
{
	draw_sprite_ext(portRight[i],portInd,x+384-(16+textX+rightShift*i),y+textY+16,1,1,0,-1,image_alpha)
	rightShift+=(32+padding);
}