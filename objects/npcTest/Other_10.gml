switch(npcGetLocation(npcKey))
{
	case "rTest1_t2": text=textLoad("testText3"); break;
	case "rTest1_t1":
		if hasData("tT1") text=textLoad("testText2");
		else text=textLoad("testText");
		break;
	default: break;
}