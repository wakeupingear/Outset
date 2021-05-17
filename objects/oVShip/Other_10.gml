event_inherited();

if !moving 
{
	yVars=oscillate(yVars,"y",false,true);
	yOff-=yVars.change; //start moving up
}