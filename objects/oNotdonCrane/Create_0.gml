event_inherited();
alarm[0]=-1;
text=textLoad("pro_haroldStuck");

image_speed=0;
image_index=4;
image_angle=(true||hasData("craneSpin"))*150-hasData("craneFlip")*30;
image_xscale=1-hasData("craneFlip")*2;

reactor=-1;