if x>anchorX+carpetLen||x<anchorX-carpetLen
{
	x=clamp(x,anchorX+carpetLen,anchorX-carpetLen);
	move=0;
}
image_index=image_number*(abs(anchorX-x)/(carpetLen+2));