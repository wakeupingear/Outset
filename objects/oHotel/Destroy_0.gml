/// @description Remove objects
for (var i=0;i<array_length(hotelComponents);i++)
{
	for (var k=0;k<array_length(hotelComponents[i]);k++)
	{
		instance_destroy(hotelComponents[i][k]);
	}
}