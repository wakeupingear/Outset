

function diagCondition(key,args){
	if string_pos(".exists",key)>0
	{
		key=string_replace(key,".exists","");
		return instance_exists(getObject(key));
	}
	else if string_pos(".getRoom",key)>0
	{
		key=string_replace(key,".getRoom","");
		return (room_get_name(global.characterLocations[? key][1])+"."+global.characterLocations[? key][4]==args[0]);
	}
	else switch (key)
	{
		case "true": return true;
		case "alive": return (global.alive);
			case "!alive": return (!global.alive);
			case "plyWithinDistance": return (instance_exists(ply)&&!instance_exists(oPlayerSoul)&&point_distance(ply.x,ply.y,args[0],args[1])<args[2]);
			case "plyLeft": return (instance_exists(ply)&&!instance_exists(oPlayerSoul)&&ply.x<args[0]);
			case "plyRight": return(instance_exists(ply)&&!instance_exists(oPlayerSoul)&&ply.x>args[0]);
			case "plyBelow": return (instance_exists(ply)&&!instance_exists(oPlayerSoul)&&ply.y>args[0]);
			case "plyRightAbove": return (instance_exists(ply)&&!instance_exists(oPlayerSoul)&&ply.x>args[0]&&ply.y<args[1]);
			case "plyInsideBox": return (instance_exists(ply)&&point_in_rectangle(ply.x,ply.y,args[0],args[1],args[2],args[3]));
			case "hasItem": return (hasItem(args[0]));
			case "hasData": return (hasData(args[0]));
			case "isChapter": return (args[0]==global.currentChapter);
			case "objRight":
				var _a=asset_get_index(args[0]);
				return (instance_exists(_a)&&_a.x>args[1]);
			default: return false;
	}
}