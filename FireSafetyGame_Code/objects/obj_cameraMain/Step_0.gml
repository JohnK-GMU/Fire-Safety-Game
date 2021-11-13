
// this is standards mode, just follow costume camera for that level
if (mode == "follow cam"){
	//ADD BOUNDRIES.
	x = obj_cameraParent.x;
	y = obj_cameraParent.y;
}

//this is when we want the camera to snapp towards the traget
else if (mode == "snap to"){
	
	// do the x
	if(x != target_x){

		var add_x = (target_x-x)/25;
		if (abs(add_x)<1){add_x=add_x/abs(add_x);}
		
		if( abs(target_x-x) < 1){ x = target_x; }
		else { x+= floor(add_x);}
		//var addx = (target_x-x)/25;
		//if(abs(addx) < 1){ x = target_x; }
		//else { x+= addx;}
		
		//x += add;
		//if (target_x == round(x)){x = target_x;}
	}
	// do the y
	if(y != target_y){
		
		var add_y = (target_y-y)/25;
		if (abs(add_y)<1){add_y=add_y/abs(add_y);}
		
		if( abs(target_y-y) < 1){ y = target_y; }
		else { y+= floor(add_y);}
		//if( abs(target_y-y) < 1){ y = target_y; }
		//else { y+= floor((target_y-y)/25);}
		/*
		y += ceil((target_y-y)/25);
		if (target_y == ceil(y)){y = target_y;}
		*/
	}
	// check if we reached target 
    if ( x == target_x && y == target_y){
		mode = "be managed";
	}
}


//this is when we want the camera to casualy move towards the traget
else if (mode == "move to"){
	
	//do the x
	if(x != target_x){
		if (abs(x - target_x) < abs(target_speed_x)) //abs(target_speed_x))
		{
			x = target_x;	
		}
	    else  {x += (target_x - x)/abs(target_x - x) * target_speed_x;}
	}
	//do the y
	if(y != target_y){
		if (abs(y - target_y) < abs(target_speed_y))
		{
			y = target_y;	
		}
	    else {y += (target_y - y)/abs(target_y - y) * target_speed_y;}
	}
	//check if we reached target
    if ( x == target_x && y == target_y){
		mode = "be managed";
	}
}


else if (mode == "be managed"){
	
//nothing will happen here, this mode is when a scene object totally play with the camera.
}

//bobbing
/*
origin_x + swing;
swing += 

*/
/*
var vm = matrix_build_lookat(x,y, -10, x,y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
*/

//FOR DEBUG 
corner_x = camera_get_view_x(view_camera[0]);
corner_y = camera_get_view_y(view_camera[0]); 