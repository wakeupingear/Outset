/// @description Create
var _num=instance_number(oLetter);

var _l=instance_create_depth(0,0,depth-2,oLetter);
_l.xOff=32+13+(_num mod 10)*32;
_l.yOff=92+13+(_num div 10)*38;
_l.letter=global.alphabet[_num+(_num>25)*26];
with _l
{
	xShift=round(-string_width(letter)/2);
	yShift=round(-string_height(letter)/2);
}

if _num<29 alarm[0]=1;
else 
{
	var _d=instance_create_depth(0,0,depth-2,oDelete);
	_d.xOff=232+13;
	_d.yOff=48+13;
	var _c=instance_create_depth(0,0,depth-2,oConfirm);
	_c.xOff=264+13;
	_c.yOff=48+13;
	
	instance_create_depth(camX()+192,camY()+108,depth-10000,oCursor);
}

/*
"?citra","...See, this is why I don't trust kids!",
        "?charlie","Uh, err, well maybe...",
        "$npcCitra.xscale",1,60,
        "?citra","Oh, it is YOU!",
        "...",
        "I am very sorry, what is your name again?",60,
        "?ply","Your name...",