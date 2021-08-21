if !render||!surface_exists(surf)
{
	if !surface_exists(surf) surf=scr_surface_create(room_width,room_height);
	surface_set_target(surf);
	draw_clear_alpha(c_black,0);
	if os_type!=os_linux
	{
		shader_set(shd_solidColor);
		shader_set_uniform_f(shader_get_uniform(shd_solidColor,"u_color"),terrainBlend[0],terrainBlend[1],terrainBlend[2],1.0);
	}
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
		with _obj draw_self();
		//draw_sprite_ext(_obj.sprite_index,_obj.image_index,_obj.x,_obj.y,_obj.image_xscale,_obj.image_yscale,_obj.image_angle,_obj.image_blend,_obj.image_alpha);
	}
	if instance_exists(oTerrainHitobj) with oTerrainHitobj draw_self();
	if shader_current()!=-1 shader_reset();
	
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
	
	if os_type!=os_linux switch (roomType)
	{
		case worldRegion.notdon:
			gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
			draw_sprite_repeated(0,0,sNotdonTerrainTexture,0,1,1,0,c_white,1,0,0);
			gpu_set_blendmode(bm_normal);
			break;
		case worldRegion.west:
			gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
			draw_sprite_repeated_offset(0,0,sWastesRocks,0,1,1,0,c_white,1,0,0,0,60);
			gpu_set_blendmode(bm_normal);
			break;
		case worldRegion.east:
			gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
			for (var i=0;i<instance_number(oTerrainGradient);i++)
			{
				var _g=instance_find(oTerrainGradient,i);
				draw_sprite_ext(_g.sprite_index,_g.image_index,-100,_g.y,(room_width+200)/_g.sprite_width,_g.image_yscale,0,-1,_g.image_alpha);
			}
			//draw_sprite_repeated(0,0,sIslandGroundTexture,0,1,1,0,c_white,0.3,0,0);
			gpu_set_blendmode(bm_normal);
			break;
		case worldRegion.testing:
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
var _col=[color_get_red(image_blend)/255,color_get_green(image_blend)/255,color_get_blue(image_blend)/255];
var _outlineAlpha=1; 
if os_type!=os_linux switch (roomType)
{
	case worldRegion.west:
		shader_set(shd_outlineTerrain);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_alpha"),_outlineAlpha);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_pixel"),texture_get_texel_width(surface_get_texture(surf)),texture_get_texel_height(surface_get_texture(surf)));
		switch room
		{
			default:
				shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_color"),colorData[roomType].outlineCol[0]*_col[0],colorData[roomType].outlineCol[1]*_col[1],colorData[roomType].outlineCol[2]*_col[2]);
				break;
		}
		break;
	case worldRegion.east:
		_outlineAlpha=0.3;
	case worldRegion.deeptown:
	case worldRegion.notdon:
		shader_set(shd_outlineTerrain);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_alpha"),_outlineAlpha);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_pixel"),texture_get_texel_width(surface_get_texture(surf)),texture_get_texel_height(surface_get_texture(surf)));
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_color"),colorData[roomType].outlineCol[0]*_col[0],colorData[roomType].outlineCol[1]*_col[1],colorData[roomType].outlineCol[2]*_col[2]);
		break;
	case worldRegion.testing:
	case worldRegion.vr:
		shader_set(shd_outlineTerrain);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_alpha"),_outlineAlpha);
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_pixel"),texture_get_texel_width(surface_get_texture(surf)),texture_get_texel_height(surface_get_texture(surf)));
		shader_set_uniform_f(shader_get_uniform(shd_outlineTerrain,"u_color"),colorData[worldRegion.notdon].outlineCol[0]*_col[0],colorData[worldRegion.notdon].outlineCol[1]*_col[1],colorData[worldRegion.notdon].outlineCol[2]*_col[2]);
		image_blend=merge_color(c_white,global.scanColor,0.1);
		if instance_exists(oTileCrack) oTileCrack.image_blend=image_blend;
		break;
	default: break;
}

if !surface_exists(surf2) surf2=scr_surface_create(386,218);
surface_set_target(surf2);
draw_clear_alpha(c_black,0);
draw_surface_part_ext(surf,
_posX,_posY,
_width+1,_height+1,
0,0,1,1,image_blend,image_alpha
);
if shader_current()!=-1 shader_reset();

if global.alive
{
	if deathScale>0 deathScale-=0.04;
	if deathDist>0 deathDist=max(deathDist-7,0);
}
else if instance_exists(ply)
{
	if deathScale<1 deathScale+=0.02;
	if deathDist<deathDistMax deathDist+=3;
}
if deathScale>0||deathDist>0
{
	var _deathCol=merge_color(c_white,global.scanColor,0.5);
	var _deathCol2=merge_color(_deathCol,c_black,0.3);
	deathAng=(deathAng-2*ply.xscale)%360;
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_src_alpha);
	draw_sprite_ext(sDeathCircle,0,ply.x-camX(),ply.y-camY(),deathScale,deathScale,deathAng,_deathCol,1);
	draw_sprite_ext(sDeathCircle,0,ply.x-camX(),ply.y-camY(),min(deathScale,0.5),min(deathScale,0.5),deathAng,_deathCol2,1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	var _deathColRGB=[color_get_red(_deathCol)/255,color_get_green(_deathCol)/255,color_get_blue(_deathCol)/255];
	var _deathCol2RGB=[color_get_red(_deathCol2)/255,color_get_green(_deathCol2)/255,color_get_blue(_deathCol2)/255];
	shader_set(shd_outlineTerrainDeath);
	var _w=1/surface_get_width(surf2);
	var _h=1/surface_get_height(surf2);
	
	shader_set_uniform_f(shader_get_uniform(shd_outlineTerrainDeath,"u_pixel"),_w,_h);
	shader_set_uniform_f(shader_get_uniform(shd_outlineTerrainDeath,"u_color"),_deathCol2RGB[0],_deathCol2RGB[1],_deathCol2RGB[2]);
	shader_set_uniform_f(shader_get_uniform(shd_outlineTerrainDeath,"u_origin"),(ply.x-camX())*_w,(ply.y-camY())*_h);
	shader_set_uniform_f(shader_get_uniform(shd_outlineTerrainDeath,"u_dist"),deathDist*_w,deathDist*_h);
}
else surface_reset_target();

draw_surface(surf2,_posX,_posY);
if shader_current()!=-1 shader_reset();