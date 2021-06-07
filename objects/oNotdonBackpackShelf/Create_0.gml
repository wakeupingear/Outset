event_inherited();
image_speed=0;

isHit=true;

if global.currentChapter!=chapters.c1 instance_destroy();
else
{
	if getDungeonProgress(dungeons.vr)<2&&false
	{
		key="c1_backpackRackBefore";
	}
	else
	{
		image_index=1+hasItem("iBackpack");
		if image_index==1 key="c1_backpackRackAfter";
	}
}