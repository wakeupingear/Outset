cID=id;
alarm[0]=1;
value=1;
image_index=(ceil(x/8)*8) mod 4

yVars=new oscillateVars(1.5,3);
yVars.pos=random(x mod (24*pi));

followGrapple=false;

if !global.alive instance_deactivate_object(id);