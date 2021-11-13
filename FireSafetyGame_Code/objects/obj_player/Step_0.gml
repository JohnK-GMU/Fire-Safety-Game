//NOTE: the slip stuff needs optimization, Directions too, Wall 2 stuff too, EVERYTHING.

//temporary
my_room = global.current_room;

if (mode != "normal"){exit;}
//?????
//add_self_to_renderList();




//**** MOVEMENT, COLLISIONS, and DIRECTIONS


// ******  H O R I Z O N T A L **********
//Get Player Input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
// Calculate Movement Direction
var move_x = key_right - key_left; // -1, 0, 1

// ******  V E R T I C A L **********
//Get Player Input
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);
// Calculate Movement 
var move_y = key_down - key_up;



//Directions
/*
if(move_x == 1) {p_direction = "right";}
else if (move_x == -1) {p_direction = "left";}
else if (move_y ==  1) {p_direction = "down";}
else if (move_y == -1) {p_direction = "up";}

if(move_x == 1 && move_y == 0){
	p_direction = "right";
}
if(move_x == -1 && move_y == 0){
	p_direction = "left";	
}
if(move_y == 1 && move_x == 0){
	p_direction = "down";
}
if(move_y == -1 && move_x == 0){
	p_direction = "up";	
}*/



hsp = move_x * walksp;
vsp = move_y * walksp;

//Adjust speed for Diagonal Pathagrioan theorem.
if(hsp != 0 && vsp != 0){
	hsp = hsp/abs(hsp) * round((sqrt(sqr(walksp)/2)));
	vsp = vsp/abs(vsp) * round((sqrt(sqr(walksp)/2)));
}


//Diagonal Wall Collision WALL2
if (place_meeting(x + hsp,y + vsp, obj_wall2))
{
	var inst = instance_place(x + hsp,y + vsp, obj_wall2);

	if(move_y == -1){ //going up
		hsp = inst.slop_v_x;
		vsp = inst.slop_v_y;
	}
	else if(move_y ==  1){ //going down
		hsp = inst.slop_v_x;
		vsp = inst.slop_v_y;
	}
	else if(move_x == -1){ //going left
		hsp = inst.slop_h_x;
		vsp = inst.slop_h_y;
	}
	else if(move_x ==  1){ //going right
		hsp = inst.slop_h_x;
		vsp = inst.slop_h_y;
	}
	else if(move_x != 0 && move_y != 0){
		hsp = 0;
		vsp = 0;
	}
	
	//more duct tape code
	if (place_meeting(x + hsp, y + vsp, obj_wall)
	||place_meeting(x + hsp,y + vsp, obj_wall3)
	||place_meeting(x + hsp,y + vsp, obj_wall2)){
		hsp = 0;
		vsp = 0;
	}
}


//Wall 3 collision WALL3
if (place_meeting(x + hsp,y + vsp, obj_wall3))
{
	var inst = instance_place(x + hsp,y + vsp, obj_wall3);
	
	with(inst){
		
		var ref_pt_x = 0;
		var ref_pt_y = 0;
		
		var side = "none";
		
		if (direction >= 0 && direction < 90){ //done
			ref_pt_x = obj_player.x - x;
			//ref_pt_y = ((ref_pt_x) * tan ((direction - 45)*(pi/180))); //can be negative
			ref_pt_y = ((ref_pt_x) * dtan (direction - 45)); //can be negative
			//compare
			//if(abs(ref_pt_y) + y > obj_player.y){side = "red";}
			if(abs(ref_pt_y) + y > obj_player.y){side = "red";}
			else{side = "blue";}
			/*
			show_debug_message("--------------------------");
			show_debug_message("1/4");
			show_debug_message(side);
			show_debug_message("ref x: " + string (ref_pt_x));
			show_debug_message("ref y: " + string (ref_pt_y));
			show_debug_message("angle: " + string (direction - 45));
			show_debug_message("tan(d): " + string (dtan (direction - 45)));
			*/
		}
		else if (direction >= 90 && direction < 180){// not done
			ref_pt_y = obj_player.y;
			ref_pt_x = ref_pt_y/tan (direction - 45);
			//compare
			if(ref_pt_x < obj_player.x){side = "blue";}
			else{side = "red";}
			show_debug_message("2/4");
		}
		else if (direction >= 180 && direction < 270){// not done
		    ref_pt_x = obj_player.x - x;
			ref_pt_y = ((ref_pt_x) * dtan (direction - 45));
			if(abs(ref_pt_y) + y > obj_player.y){side = "red";}
			else{side = "blue";}
			/*
			ref_pt_x = obj_player.x;
			ref_pt_y = ref_pt_x * tan (45 - (direction-180));
			//compare
			if(ref_pt_y > obj_player.x){side = "red";}
			else{side = "blue";}
			show_debug_message("3/4");
			*/
		}
		else if (direction >= 270 && direction < 360){// not done
		    ref_pt_x = obj_player.x - x;
			ref_pt_y = ((ref_pt_x) * dtan (direction - 45));
			if(abs(ref_pt_y) + y > obj_player.y){side = "red";}
			else{side = "blue";}
			/*
			ref_pt_y = obj_player.y;
			ref_pt_x = ref_pt_y/tan (direction - 180);
			//compare
			if(ref_pt_x > obj_player.x){side = "blue";}
			else{side = "red";}
			show_debug_message("4/4");
			*/
		}	
		
		color = side; 
		end_pt_x = ref_pt_x;
		end_pt_y = ref_pt_y;
		
		//now we know whether is red or blue.
		if (side == "red"){
			var slop_h_x = red_slop_h_x;
		    var slop_h_y = red_slop_h_y;
			var slop_v_x = red_slop_v_x;
			var slop_v_y = red_slop_v_y;
		}else{
			var slop_h_x = blue_slop_h_x;
		    var slop_h_y = blue_slop_h_y;
			var slop_v_x = blue_slop_v_x;
			var slop_v_y = blue_slop_v_y;
		}
		
		//Repeat wall 2 logic
		if(obj_player.vsp < 0){//going up
		other.hsp = slop_v_x;
		other.vsp = slop_v_y;
		}
		else if(other.vsp > 0){ //going down
		other.hsp = slop_v_x;
		other.vsp = slop_v_y;
		}
		else if(other.hsp < 0){ //going left
		other.hsp = slop_h_x;
		other.vsp = slop_h_y;
		}
		else if(other.hsp > 0){ //going right
		other.hsp = slop_h_x;
		other.vsp = slop_h_y;
		}
		
		
	}
	
	//duct tape code
	if (place_meeting(obj_player.x + hsp,y + vsp, obj_wall2)){
		hsp = 0; vsp = 0;		
	}
	
}


//Horizontal Collision WALL1
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x = x + sign(hsp);
	}

	 //my slip edit
	//Towards the up
	var spot = 0;
	var slip = false;
	while (spot <= slip_offset){
		spot++;
		if (!place_meeting(x+hsp,y-spot ,obj_wall)){
			slip = true;
			break;
		}
	}
	if (slip == true && vsp == 0){
		vsp = -1*slip_speed;
	}
	//Towards the down
	spot = 0;
	slip = false;
	while (spot <= slip_offset){ 
		spot++;
		if (!place_meeting(x+hsp,y+spot,obj_wall)){
			slip = true;
			break;
		}   	
	}
	if (slip == true && vsp == 0){
		vsp = slip_speed;
	}
		
	hsp = 0;
}
	
//Vertical Collision WALL1
if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y= y + sign(vsp);	
	}
		
	//my slip edit
	//Towards the left
	var spot = 0;
	var slip = false;
	while (spot <= slip_offset){
		spot++;
		if (!place_meeting(x - spot,y+vsp,obj_wall)){
			slip = true;
			break;
		}
	}
	if (slip == true && hsp == 0){
		hsp = -1*slip_speed;
	}
	//Towards the right
	spot = 0;
	slip = false;
	while (spot <= slip_offset){
		spot++;
		if (!place_meeting(x + spot,y+vsp,obj_wall)){
			slip = true;
			break;
		}   	
	}
	if (slip == true && hsp == 0){
		hsp = slip_speed;
	}
	
	vsp = 0;
}

//Directions - new
if( hsp == 0 && vsp <= -1){
	p_direction = 0;
	walking_sprite = 0;
	image_flip = 1;
}
else if(hsp >= 1 && vsp <= -1){
	p_direction = 1;
	walking_sprite = 1;
	image_flip = 1;
}
else if(hsp >= 1 && vsp == 0){
	p_direction = 2;
	walking_sprite = 2;
	image_flip = 1;
}
else if(hsp >= 1 && vsp >= 1){
	p_direction = 3;
	walking_sprite = 3;
	image_flip = 1;
}
else if(hsp == 0 && vsp >= 1){
	p_direction = 4;
	walking_sprite = 4;
	image_flip = -1;
}
else if(hsp <= -1 && vsp >= 1){
	p_direction = 5;
	walking_sprite = 3;
	image_flip = -1;
}
else if(hsp <= -1 && vsp == 0){
	p_direction = 6;
	walking_sprite = 2;
	image_flip = -1;
}
else if(hsp <= -1 && vsp <= -1){
	p_direction = 7;
	walking_sprite = 1;
	image_flip = -1;
}


x += hsp;
y += vsp;
