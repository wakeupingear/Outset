if !render||!surface_exists(surf)
{
	if !surface_exists(surf) surf=surface_create(room_width,room_height);
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	shader_set(shd_solidColor);
	shader_set_uniform_f(shader_get_uniform(shd_solidColor,"u_color"),terrainBlend[0],terrainBlend[1],terrainBlend[2],1.0);
	for (var i=0;i<ds_list_size(terrain);i++)
	{
		var _obj=terrain[|i];
		if !instance_exists(_obj)
		{
			ds_list_delete(terrain,i);
			i--;
			continue;
		}
		if _obj.image_blend!=c_white
		{
			ds_list_add(terrainColor,_obj);
			ds_list_delete(terrain,i);
			i--;
			continue;
		}
		draw_sprite_ext(_obj.sprite_index,_obj.image_index,_obj.x,_obj.y,_obj.image_xscale,_obj.image_yscale,_obj.image_angle,_obj.image_blend,_obj.image_alpha);
	}
	if instance_exists(oTerrainHitobj) with oTerrainHitobj draw_self();
	shader_reset();
	
	for (var i=0;i<ds_list_size(terrainColor);i++)
	{
		var _obj=terrainColor[|i];
		if !instance_exists(_obj)
		{
			ds_list_delete(terrainColor,i);
			i--;
			continue;
		}
		draw_sprite_ext(_obj.sprite_index,_obj.image_index,_obj.x,_obj.y,_obj.image_xscale,_obj.image_yscale,_obj.image_angle,_obj.image_blend,_obj.image_alpha);
	}
	
	switch (roomType)
	{
		case worldRegion.notdon:
			gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
			draw_sprite_repeated(0,0,sVShip,0,1,1,0,c_white,1,0,-128);
			gpu_set_blendmode(bm_normal);
			break;
		case worldRegion.vr:
			gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
			draw_sprite_repeated(0,0,sMykoBrickGreyTile,0,1,1,0,c_white,1,0,0);
			gpu_set_blendmode(bm_normal);
			break;
		default: break;
	}
	surface_reset_target();
	render=true;
}

var _width=min(386,room_width);
var _height=min(218,room_height);
var _posX=max(floor(camX()),0);
var _posY=max(floor(camY()),0);
switch (roomType)
{
	case worldRegion.notdon:
		shader_set(shd_outlineTerrain);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_pixel"),texture_get_texel_width(surface_get_texture(surf)),texture_get_texel_height(surface_get_texture(surf)));
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_color"),colorData[worldRegion.notdon].outlineCol[0],colorData[worldRegion.notdon].outlineCol[1],colorData[worldRegion.notdon].outlineCol[2]);
		break;
	case worldRegion.vr:
		shader_set(shd_outlineTerrainTop);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_pixel"),texture_get_texel_width(surface_get_texture(surf)),texture_get_texel_height(surface_get_texture(surf)));
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_color"),colorData[worldRegion.notdon].outlineCol[0],colorData[worldRegion.notdon].outlineCol[1],colorData[worldRegion.notdon].outlineCol[2]);
		break;
	default: break;
}

draw_surface_part(surf,
_posX,_posY,
_width,_height,
_posX,_posY
);

if shader_current()!=-1 shader_reset();