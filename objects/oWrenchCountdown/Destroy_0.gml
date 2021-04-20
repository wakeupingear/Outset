/// @description Remove event
eventRemoveDefault(xstart,ystart);

var _dir=irandom_range(30,150);
particle(x,y,depth,sprite_index,0,{dir: _dir,falling: true, angSpd: round((_dir-90)/8),spd: 8});