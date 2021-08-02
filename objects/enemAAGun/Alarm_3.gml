/// @description Change gun color
if gunBlend==c_white gunBlend=c_red;
else gunBlend=c_white;

mode=round(mode);
alarm[3]=30-mode*4;
mode+=0.8;