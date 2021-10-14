alarm[0]=5;

str="";
strLen=7;
output=0;

bgProg=0;

processInput=function(){
	switch output
	{
		case 0:
			global.name=str;
			if instance_exists(oTextbox) oTextbox.saved=true;
			else save(global.lastFile);
			var _lowerStr=string_lower(global.name);
			switch _lowerStr
			{
				case "jack":
					insertText("c1_"+_lowerStr);
					break;
				default: break;
			}
			if instance_exists(oCursor) instance_destroy(oCursor);
			break;
		default: break;
	}
}