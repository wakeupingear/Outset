/// @description Remove event
eventRemoveDefault(xstart,ystart);
addData("craneSpin");
instance_create_layer(x,y,"bg",oVShip);

var _dir=irandom_range(30,150);
particle(x,y,depth,sprite_index,0,{dir: _dir,falling: true, angSpd: round((_dir-90)/8),spd: 8});