/// @description Draw for trees
shader_set(shd_islandTrees);
var _uni=shader_get_uniform(shd_outlineTerrain,"u_pixel");
with oIslandTree1 
{
	shader_set_uniform_f(_uni,abs(1/sprite_width),abs(1/sprite_height));
	draw_self();
}
shader_reset();