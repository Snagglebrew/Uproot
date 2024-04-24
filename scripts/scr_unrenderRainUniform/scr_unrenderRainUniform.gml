function unrenderRainSetUniforms()
{
	// getting the uniform handles
	var arrayHandle = shader_get_uniform(sdr_unrenderRain, "boundingBoxes");
	var numObjectsHandle = shader_get_uniform(sdr_unrenderRain, "numBoundingBoxes");
	
	// add each object to an array
	var objects = [];
	var objectIndex = 0;
	
	// add all blocking rain objects to the array
	with (obj_blockRain)
	{
		var i = 4 * objectIndex;
		
		objects[i] = bbox_left;
		objects[i + 1] = bbox_top;
		objects[i + 2] = bbox_bottom;
		objects[i + 3] = bbox_right
		
		objectIndex++;
	}
	
	// add all solid objects to the array
	with (obj_block)
	{
		var i = 4 * objectIndex;
		
		objects[i] = bbox_left;
		objects[i + 1] = bbox_top;
		objects[i + 2] = bbox_bottom;
		objects[i + 3] = bbox_right
		
		objectIndex++;
	}
	
	// sending the uniforms to the shader
	// to send an array of vec4's to a uniform, u have to use a float array 
	// where every 4 floats is x, y, z, and w respectively
	shader_set_uniform_f_array(arrayHandle, objects);
	shader_set_uniform_i(numObjectsHandle, objectIndex);
}