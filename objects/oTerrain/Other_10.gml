/// @description Set terrainType
if room==rStartup instance_destroy();
else
{
	terrainBlend=colorData[roomRegion].baseColor;
	switch (room)
	{
		default:
			switch (roomRegion)
			{
				default:
					roomType=roomRegion;
					break;
			}
			break;
	}
}