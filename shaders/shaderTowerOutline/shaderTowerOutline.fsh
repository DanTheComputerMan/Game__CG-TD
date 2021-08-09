//
// Simple passthrough fragment shader
//

// In shaders, you NEED semicolons at the end or it won't compile.

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texture_Pixel;

//uniform float pixelH; // pixel height.
//uniform float pixelW; // pixel width.

void main()
{
	vec4 end_pixel = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec2 thickness = texture_Pixel * 2.0;
	
	if (texture2D(gm_BaseTexture, v_vTexcoord).a <= 0.0) {
		float alpha = 0.0;
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - thickness.x, v_vTexcoord.y)).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + thickness.x, v_vTexcoord.y)).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - thickness.y)).a);
		alpha = max(alpha, texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + thickness.y)).a);
		
		if (alpha != 0.0) {
			end_pixel = vec4(1.0);
		}
	}
	
	gl_FragColor = end_pixel;
	
	//vec2 offsetx;
	//// shaders don't measure in pixels, they measure in texels.
	//offsetx.x = pixelW; // work out width of pixel in texture page.
	//vec2 offsety;
	//offsety.y = pixelH;
	
	//// The "outline" section. It adds a pixel to all surrounding pixels that have an alpha.
	//float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a);
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a);
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsety).a);
	//alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsety).a);
	
	
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	//// Set alpha of pixel to the correct alpha.
	//gl_FragColor.a = alpha;
}
