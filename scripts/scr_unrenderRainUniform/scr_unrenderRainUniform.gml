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
		objects[objectIndex] = id;
		
		objectIndex++;
	}
	
	// add all solid objects to the array
	with (obj_block)
	{
		objects[objectIndex] = id;
		
		objectIndex++;
	}
	
	// declaring the array used for each objects bounding boxes
	var objectBoundingBoxes = [];
	
	for (var i = 0; i < 4 * objectIndex; i += 4)
	{
		// getting the object
		var obj = objects[i / 4];
		
		// setting each objects bounding boxes
		// to set vectors in uniforms, its [x0, y0, z0, w0, x1, y1, z1, w1] etc.
		objectBoundingBoxes[i] = obj.bbox_left;
		objectBoundingBoxes[i + 1] = obj.bbox_top;
		objectBoundingBoxes[i + 2] = obj.bbox_bottom;
		objectBoundingBoxes[i + 3] = obj.bbox_right;
	}
	
	// sending the uniforms to the shader
	shader_set_uniform_f_array(arrayHandle, objectBoundingBoxes);
	shader_set_uniform_i(numObjectsHandle, objectIndex);
}