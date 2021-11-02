#region exit conditions

	if(surface_width <= 0 || surface_height <= 0){
		show_debug_message("obj_colourise_filter: Wrong Dimensions");
		return;
	}

#endregion

#region recreate surface

	if(!surface_exists(surface)){
		surface = surface_create(surface_width, surface_height);	
	}

#endregion

#region declarations

	var _camX = camX();
	var _camY = camY();

#endregion

#region draw
		
	surface_set_target(surface);
	
		draw_clear_alpha(c_white, 0);
			
		draw_surface(application_surface, 0, 0);
		
	surface_reset_target();
					  
	shader_set(shader);
	
		Pass_Uniforms();		
			draw_surface_part_ext(surface, 1,1, 382, 214,_camX+1,_camY+1, 1, 1, c_white, image_alpha);
			
	shader_reset();

#endregion