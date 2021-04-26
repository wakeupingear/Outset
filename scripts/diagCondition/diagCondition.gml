// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function diagCondition(key,args){
	if string_pos("Exists",key)>0
	{
		key=string_replace(key,"Exists","");
		return instance_exists(asset_get_index(key));
	}
	else switch (key)
	{
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
			case "objRight":
				var _a=asset_get_index(args[0]);
				return (instance_exists(_a)&&_a.x>args[1]);
			default: return false;
	}
}