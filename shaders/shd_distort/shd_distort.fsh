varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float OffsetX;
uniform float OffsetY;
uniform bool aberration;

uniform sampler2D distortion_texture_page; // the name of the surface in the shader	

void main()
{
    // find the offset colour for this location (this is where the magic happens) 
    vec4 distort_data = vec4( (v_vColour * texture2D( distortion_texture_page, v_vTexcoord)).xyzw);
	vec2 distort_amount=vec2(distort_data.xy);
	
    // FOR NORMAL MAPS:  (	either directX or OpenGL flip the green channel, 
    //			while you dont need to worry about it in GM more 
    //			normal maps have green pointing the wrong way)
    distort_amount.x = 1.0 - distort_amount.x;
	
    distort_amount -= 0.5;//128.0;
    if (distort_amount.x > 0.5) {distort_amount.x -= 1.0;}// wrap around
    if (distort_amount.y > 0.5) {distort_amount.y -= 1.0;}// wrap around
    distort_amount /= 7.0;
	
	if (aberration)
	{
		float prog=max(abs(distort_amount.x),abs(distort_amount.y))*80.0*distort_data.a;//sqrt(pow(distort_amount.x,2.0)+pow(distort_amount.y,2.0));
		vec2 coord=v_vTexcoord+distort_amount*distort_data.a;
		vec4 col = v_vColour * texture2D( gm_BaseTexture, coord );
	
	
		vec2 vecR = vec2(coord.x - OffsetX*0.142*prog,  coord.y - OffsetY * 0.0948*prog);
		vec2 vecG = vec2(coord.x + OffsetX*0.0943*prog, coord.y - OffsetY * 0.05829*prog);
		vec2 vecB = vec2(coord.x - OffsetX*0.042*prog,  coord.y + OffsetY * 0.0624*prog);
	
			vecR.x = mod(vecR.x, 1.0);
			vecR.y = mod(vecR.y, 1.0);
		
			vecG.x = mod(vecG.x, 1.0);
			vecG.y = mod(vecG.y, 1.0);
		
			vecB.x = mod(vecB.x, 1.0);
			vecB.y = mod(vecB.y, 1.0);


	    gl_FragColor = vec4(texture2D(gm_BaseTexture, vecR).r, 
								texture2D(gm_BaseTexture, vecG).g, 
								texture2D(gm_BaseTexture, vecB).b, 
								distort_data.a);
	}
	else gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord+distort_amount*distort_data.a);
}