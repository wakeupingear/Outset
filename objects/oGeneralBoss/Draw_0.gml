event_inherited();

if fightState==GeneralFight.shootPly{
	if plyInArena(){
		draw_line(x,y,ply.x,ply.y);
	}
}
else if fightState==GeneralFight.shootBox{
	for (var i=0;i<ds_list_size(containers);i++){
		if instance_exists(containers[|i]){
			draw_line(x,y,containers[|i].x,containers[|i].y);
			
		}
	}
}