varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 v_vObjectPos;

// each objects bounding boxes and number of objects
// [x, y, z, w] = [left, top, bottom, right]
uniform vec4 boundingBoxes[64];
uniform int numBoundingBoxes;

void main()
{
	// setting the initial fragment color
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	// loop over every object
	for (int i = 0; i < numBoundingBoxes; i++)
	{
		// shortening the current box and "pixel" position
		vec4 box = boundingBoxes[i];
		vec4 pos = v_vObjectPos;
		
		// scuffed bounding box collision check
		// technically not an AABB collision check but its very similar
		if (pos.x >= box.x && pos.y >= box.y && pos.y <= box.z && pos.x <= box.w)
		{
			// make the pixel transparent if its in the bounding box
			gl_FragColor = vec4(gl_FragColor.r, gl_FragColor.g, gl_FragColor.b, 0.0);
		}
	}
}
