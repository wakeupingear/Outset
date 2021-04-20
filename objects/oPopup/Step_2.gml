/// @description Animation

if mode==1 //fade in
{
	image_alpha+=0.1;
	if image_alpha>=1 mode=0;
}
else if mode<0 //fade out
{
	image_alpha-=0.1;
	if image_alpha<=0 
	{
		if mode==-1&&instance_exists(oTextbox) 
		{
			global.menuOpen=false;
			oTextbox.mode=0;
			oTextbox.boxHidden=false;
		}
		instance_destroy();
	}
}

if stackType==1
{
	if darken<0.4 darken+=0.02;
}
else
{
	if darken>0 darken-=0.02;
}