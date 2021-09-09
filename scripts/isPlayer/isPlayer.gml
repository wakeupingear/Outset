function isPlayer(_p){
	return (object_is_ancestor(_p.object_index,ply)||_p.object_index==ply);
}