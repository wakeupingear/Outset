image_speed=0;
image_alpha=0;
x=192-(sprite_width/2-sprite_get_xoffset(sprite_index));
y=108-(sprite_height/2-sprite_get_yoffset(sprite_index));

surf=-1;
exiting=false;

interactable=-1;
original=(instance_number(oPopup)==1);
animMode=0; //0: move up; 1: move in from right
mode=1;
stackType=0; //0: only 1; 1: below something else; 2: very top of stack
below=-1;
darken=0;

text="";
textCol=c_nearBlack;
textSurf=-1;

topLeft=-1;
botRight=-1;

xx=0;
yy=0;

objs=-1;
objList=-1;