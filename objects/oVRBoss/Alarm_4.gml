/// @description Crack
phase=(3-myHealth);
if phase>-1&&phase<array_length(positions)
{
	xTo=positions[phase][0];
	yTo=positions[phase][1];
}

setBlocks();

//events
if phase==1 oCage.xTo=296;
else if phase==2 oCage.xTo=330;