function checkSouldrop(){
	if global.souldrop>=global.soulLevels[global.level]
	{
		global.level++;
		global.maxHealth++;
		global.plyHealth=global.maxHealth;
		circularParticle(x,y,depth+1,{
			alpha:0.5,
			fade:0.005,
			radiusSpd:2,
			blend: c_soulBlue,
			alwaysMove: true,
			isBG: true, xLerp:1, yLerp:1, xOff: controller.getHudX(), yOff: 24
		});
		particle(x,y,controller.depth,sHudHealth,0,{
			fade:0.025,
			alpha: global.hudAlpha,
			blend: merge_color(global.hudColorList[global.hudColor],c_white,0.5),
			xscaleSpd: 0.05,
			yscaleSpd:0.05,
			alwaysMove: true,
			isBG: true, xLerp:1, yLerp:1, xOff: controller.getHudX(), yOff: 24
		});
		particle(x,y,controller.depth,sNormalRipple,0,{
			distort: true,aberration: false,xscale:0.05,yscale:0.05,xscaleSpd:0.035,yscaleSpd:0.035,
			fade:0.025,alpha:3,alwaysMove: true,
			isBG: true, xLerp:1, yLerp:1, xOff: controller.getHudX(), yOff: 24
		});
		if global.level==1 //first time
		{
			conversation("pro_souldropLevel");
		}
		save(global.lastFile);
	}
}