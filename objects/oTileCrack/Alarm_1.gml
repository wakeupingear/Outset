/// @description Solidify
y=ystart;
if isHit hit.y=y;
for (var i=0;i<array_length(parts);i++) if parts[i]!=-1&&instance_exists(parts[i]) instance_destroy(parts[i]);
renderTerrain();
//with oPhysicsObj while groundCollision(x,y) y--;