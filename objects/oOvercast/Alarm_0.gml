/// @description Set variables from index
xLerp=0.8+image_index*0.1;
yLerp=xLerp;
tileX=true;

yVars=new oscillateVars(5,8);
yVars.pos+=pi*image_index/2;