#region functions
	
	#region Destroy
	
		Destroy = function(){
			if(surface_exists(surface)){				
				surface_free(surface);	
			}
		}
	
	#endregion
	
	#region Pass_Uniforms
	
		Pass_Uniforms = function(){
			
		}
	
	#endregion
	
#endregion

#region declarations
	
	shader         = noone;
	surface        = noone;
				   
	surface_width  = 384;
	surface_height = 216;

#endregion
