

function freezeNPC(){
	for (var i=0;i<instance_number(npc);i++) with instance_find(npc,i) if !object_is_ancestor(object_index,enem)
	{
		var _u=capitalizeFirstLetter(npcKey);
		var _struct={
			vsp: vsp,
			hsp: hsp,
			state: state,
			index: image_index,
			xscale: xscale,
			yscale:yscale,
			_x: x,
			_y: y,
			canMove: canMove,
			move: move,
			jump: jump,
			jumpAdd: jumpAdd,
			coyote: coyote,
			
			text: text,
			
			pathfinding: pathfinding,
			pathfindingInterrupt: pathfindingInterrupt,
			pfX: pfX,
			pfY: pfY,
			pfRad: pfRad,
			pfWait: pfWait,
			pfInd: pfInd,
			moveCommand: moveCommand,
			stuckTime: stuckTime,
			reachedTarget: reachedTarget,
			jumpCheck: jumpCheck,
			
			currentAnimation: animation.currentAnimation,
			animCount: animation.animCount,
			animDir: animation.animDir,
			animating: animation.animating
		};
		variable_struct_set(global.npcStates,_u,_struct);
	}
}

function setFrozenNPC(){
	if room==global.dieRoom
	{
		var _n=variable_struct_get_names(global.npcStates);
		for (var i=0;i<array_length(_n);i++)
		{
			if instance_exists(asset_get_index("npc"+_n[i])) with asset_get_index("npc"+_n[i])
			{
				var _struct=global.npcStates[$ _n[i]];
				vsp=_struct.vsp;
				hsp=_struct.hsp;
				state=_struct.state;
				image_index=_struct.index;
				xscale=_struct.xscale;
				yscale=_struct.yscale;
				x=_struct._x;
				y=_struct._y;
				canMove=_struct.canMove;
				move=_struct.move;
				jump=_struct.jump;
				jumpAdd=_struct.jumpAdd;
				coyote=_struct.coyote;
			
				text=_struct.text;
			
				pathfinding=_struct.pathfinding;
				pathfindingInterrupt=_struct.pathfindingInterrupt;
				pfX=_struct.pfX;
				pfY=_struct.pfY;
				pfRad=_struct.pfRad;
				pfWait=_struct.pfWait;
				pfInd=_struct.pfInd;
				moveCommand=_struct.moveCommand;
				stuckTime=_struct.stuckTime;
				reachedTarget=_struct.reachedTarget;
				jumpCheck=_struct.jumpCheck;
			
				animation.currentAnimation=_struct.currentAnimation;
				animation.animCount=_struct.animCount;
				animation.animDir=_struct.animDir;
				animation.animating=_struct.animating
			}
		}
	}
}