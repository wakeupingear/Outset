/// @description Draw
for (var i=0;i<1+(tile)*ceil(room_width/tileWidth);i++)
{
	for (var k=0;k<1+(tile)*ceil(room_height/tileHeight);k++)
	{
		draw(x+i*tileWidth,y+k*tileHeight);
	}
}