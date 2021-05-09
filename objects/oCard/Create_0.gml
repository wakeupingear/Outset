image_speed=0;
image_xscale=-1; //keeps track of flipped
image_yscale=1;
startDepth=depth;

parent=-1; //card that this is stacked on
child=-1; //card stacked on top of this

suit=suits.hearts; //suit
card=cards.ace; //card
textCol=c_red;
target_x=0; //location to move towards
target_y=0; 
moving=true; //whether it is moving
inDeck=false; //whether it is part of the deck
isFound=false;
mode=0; //0=sitting, 1=directly dragged, 2=parent dragged
mouseXOff=0;
mouseYOff=0;