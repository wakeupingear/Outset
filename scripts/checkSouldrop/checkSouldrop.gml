function checkSouldrop(){
	if global.souldrop>=global.soulLevels[global.level]
	{
		global.level++;
		global.maxHealth++;
		global.plyHealth=global.maxHealth;
		if global.level==1 //first time
		{
			conversation("pro_souldropLevel");
		}
		save(global.lastFile);
	}
}