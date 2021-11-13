prompt = "";
show_prompt = false;

//go to the next level
if (door_taken == true && window_taken == true && phone_taken == true){
		if(instance_exists(obj_fade)){
			if (obj_fade.a == 1){
				room_goto(Room_floor8);
			}
		} else {
			global.fade_color = c_black;
			global.fade_mode = 2;
			global.fade_speed = 0.01;
			global.fade_turnNormal = false;
			instance_create_layer(0, 0, "Instances", obj_fade);
		}
}
//******************************************************************************************
//pick up towel
if (towel_taken == false && obj_player.mode == "normal"){
	if (collision_rectangle(hanger_x, hanger_y+32, hanger_x+50, hanger_y+75, obj_player, false, false) != noone){
		prompt = "Take Towel";
		global.prompt_bar = 2;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			towel_taken = true;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
	}
}

//wet the towel
if (wet_taken == false && towel_taken == true && obj_player.mode == "normal"){
	if (collision_rectangle(wet_x -32, wet_y-32, wet_x+32, wet_y+40, obj_player, false, false) != noone){
		prompt = "Soak the towel";
		global.prompt_bar = 4;
		show_prompt = true;
		if keyboard_check_pressed(ord("X")){
			wet_taken = true;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
	}	
}


//interact with the door
if (door_taken == false &&obj_player.mode == "normal"){
	if (collision_rectangle(door_x-32, door_y+0, door_x+32, door_y+32, obj_player, false, false) != noone){
		if (wet_taken == true){
			prompt = "Cover gap with towel";
			global.prompt_bar = 6;
			show_prompt = true;
			if keyboard_check_pressed(ord("X")){
				door_taken = true;
				animate = true;
				animate_index = 0;
				obj_player.mode = "cutscene";
			}
		} else{ //get ur hands burned
			if(red_door == false){
				global.prompt_bar = 6;
				prompt = "Touch door handle";
				show_prompt = true;
				if keyboard_check_pressed(ord("X")){
					red_door = true;
				}
			}
			
		}
	}
}



//close the window
if (window_taken == false && collision_rectangle(window_x+32, window_y+20, window_x+100+32, window_y+160, obj_player, false, false) != noone){
		prompt = "Open window";
		global.prompt_bar = 3;
		show_prompt = true;
		if (keyboard_check_pressed(ord("X"))){
			window_taken = true;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
}

//call for help
if (phone_taken == false && collision_rectangle(phone_x, phone_y+20, phone_x+32, phone_y+140, obj_player, false, false) != noone){
		prompt = "Call for help";
		global.prompt_bar = 3;
		show_prompt = true;
		if (keyboard_check_pressed(ord("X"))){
			phone_taken = true;
			animate = true;
			animate_index = 0;
			obj_player.mode = "cutscene";
		}
}



